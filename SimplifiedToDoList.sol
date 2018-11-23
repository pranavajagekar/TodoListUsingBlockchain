pragma solidity ^0.4.19;

contract SimplifiedTodolist {
    
     struct task  {
        uint TaskNumber; 
        string Description;
        uint MinimumTimeReqired;
        uint TaskFinishPeriod;
        uint Priority;
        uint TaskSettingTime;
        uint TaskEndingTime;
       // string Status;
    }
    
    struct Task {
        
        task[3] tasks;
    }
    
    mapping (address => Task)  Tasks;
    mapping (address => uint) lastBid;
    mapping (address => string) status;
    
    function AddNewTask (string _Description, uint _MinimumTimeRequired , uint _TaskFinishPeriod, uint _Priority) returns(string ){
        address hash;
        Tasks[msg.sender].tasks[lastBid[msg.sender]].TaskNumber=lastBid[msg.sender];
        Tasks[msg.sender].tasks[lastBid[msg.sender]].Description = _Description;
        Tasks[msg.sender].tasks[lastBid[msg.sender]].MinimumTimeReqired = _MinimumTimeRequired;
        Tasks[msg.sender].tasks[lastBid[msg.sender]].TaskFinishPeriod = _TaskFinishPeriod;
        Tasks[msg.sender].tasks[lastBid[msg.sender]].Priority = _Priority;
        Tasks[msg.sender].tasks[lastBid[msg.sender]].TaskSettingTime = now;
        Tasks[msg.sender].tasks[lastBid[msg.sender]].TaskEndingTime = now + (3600*_TaskFinishPeriod);
        hash = address(keccak256(_Description));
        status[hash] = "Not Complited";
        lastBid[msg.sender]++;
        return("New Task Added");
    }
    
    function ShowTask() public constant returns(string Description1 , string StatusOfTask1,string Description2 , string StatusOfTask2,string Description3 , string StatusOfTask3){
        string a= Tasks[msg.sender].tasks[0].Description;
        address b=address(keccak256(Tasks[msg.sender].tasks[0].Description));
        string c= Tasks[msg.sender].tasks[1].Description;
        address d=address(keccak256(Tasks[msg.sender].tasks[1].Description));
        string e= Tasks[msg.sender].tasks[2].Description;
        address f=address(keccak256(Tasks[msg.sender].tasks[2].Description));
        return(a,status[b],c,status[d],e,status[f]);
    }
    
    function MarkTaskAsComplited(uint _TaskNumber)returns(string){
        address hash;
        string a= Tasks[msg.sender].tasks[_TaskNumber-1].Description;
        hash = address(keccak256(Tasks[msg.sender].tasks[_TaskNumber-1].Description));
        status[hash] = "Complited";
        return("CongratsTaskComplited");
    }
    
    function DeleteCompleted () {
        
        string a= Tasks[msg.sender].tasks[0].Description;
        address b=address(keccak256(Tasks[msg.sender].tasks[0].Description));
        if(address(keccak256(status[b]))==address(keccak256("Complited")))
         {Tasks[msg.sender].tasks[0].Description="ADD NEW TASK";
        status[b]="    ";}
        string c= Tasks[msg.sender].tasks[1].Description;
        address d=address(keccak256(Tasks[msg.sender].tasks[1].Description));
        if(address(keccak256(status[d]))==address(keccak256("Complited")))
         {Tasks[msg.sender].tasks[1].Description="ADD NEW TASK";
        status[d]="    ";} 
        string e= Tasks[msg.sender].tasks[2].Description;
        address f=address(keccak256(Tasks[msg.sender].tasks[2].Description));
        if(address(keccak256(status[f]))==address(keccak256("Complited")))
         {Tasks[msg.sender].tasks[2].Description="ADD NEW TASK";
        status[f]="    ";}
    }
    
    function Driverfunction(){
        
        AddNewTask("AMC-ICPC", 2, 24, 3);
        AddNewTask("Codechef", 1, 24, 2);
        AddNewTask("SRM", 3, 24, 1);
    }
    
    function ArrangeAccordingToPriority(){
        uint i=0;
        uint tempuint;
        string tempstring;
            if(Tasks[msg.sender].tasks[i].Priority > Tasks[msg.sender].tasks[i+1].Priority)
            {
                tempuint=Tasks[msg.sender].tasks[i].TaskNumber;
                Tasks[msg.sender].tasks[i+1].TaskNumber=tempuint;
                tempstring=Tasks[msg.sender].tasks[i].Description;
                Tasks[msg.sender].tasks[i+1].Description=tempstring;
                tempuint=Tasks[msg.sender].tasks[i].MinimumTimeReqired;
                Tasks[msg.sender].tasks[i+1].MinimumTimeReqired=tempuint;
                tempuint=Tasks[msg.sender].tasks[i].TaskFinishPeriod;
                Tasks[msg.sender].tasks[i+1].TaskFinishPeriod=tempuint;
                tempuint=Tasks[msg.sender].tasks[i].Priority;
                Tasks[msg.sender].tasks[i+1].Priority=tempuint;
                tempuint=Tasks[msg.sender].tasks[i].TaskSettingTime;
                Tasks[msg.sender].tasks[i+1].TaskSettingTime=tempuint;
                tempuint=Tasks[msg.sender].tasks[i].TaskEndingTime;
                Tasks[msg.sender].tasks[i+1].TaskEndingTime=tempuint;
            }
        i=1;
        if(Tasks[msg.sender].tasks[i].Priority > Tasks[msg.sender].tasks[i+1].Priority)
            {
                tempuint=Tasks[msg.sender].tasks[i].TaskNumber;
                Tasks[msg.sender].tasks[i+1].TaskNumber=tempuint;
                tempstring=Tasks[msg.sender].tasks[i].Description;
                Tasks[msg.sender].tasks[i+1].Description=tempstring;
                tempuint=Tasks[msg.sender].tasks[i].MinimumTimeReqired;
                Tasks[msg.sender].tasks[i+1].MinimumTimeReqired=tempuint;
                tempuint=Tasks[msg.sender].tasks[i].TaskFinishPeriod;
                Tasks[msg.sender].tasks[i+1].TaskFinishPeriod=tempuint;
                tempuint=Tasks[msg.sender].tasks[i].Priority;
                Tasks[msg.sender].tasks[i+1].Priority=tempuint;
                tempuint=Tasks[msg.sender].tasks[i].TaskSettingTime;
                Tasks[msg.sender].tasks[i+1].TaskSettingTime=tempuint;
                tempuint=Tasks[msg.sender].tasks[i].TaskEndingTime;
                Tasks[msg.sender].tasks[i+1].TaskEndingTime=tempuint;
            }
    }
}












