library(UBCRM)


### Name: Crm
### Title: Dose-escalation with the Continual Reassessment Method
### Aliases: Crm

### ** Examples

data<- CreData(5)
data<- updata(data,1,3,0)
data<- updata(data,2,3,1)
data<- updata(data,2,3,1)
data
Crm(data,prior=c(0.1,0.15,0.25,0.35,0.45),target=0.3,nextlevel="ntarget",nptmax=24,nmaxmtd=6)
data<- updata(data,3,3,2)
data
Crm(data,prior=c(0.1,0.15,0.25,0.35,0.45),target=0.3,nextlevel="ntarget",nptmax=24,nmaxmtd=6)



