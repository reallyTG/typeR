library(OptimalTiming)


### Name: sim.MTL
### Title: Simulate mean total lifetime
### Aliases: sim.MTL

### ** Examples


## Not run: 
##D library(OptimalTiming)
##D 
##D ##################################
##D ## Example 1: This example shows how to use this package to find
##D ## the optimal timing of new treatment initiation
##D 
##D ## read data
##D data(SimCml)
##D 
##D ## fit multistate model with treatment not equals NULL
##D fit=optim.fit(data=SimCml,
##D          transM=matrix(c(0,1,0,0,0,1,0,0,0,1,0,1,1,1,0,0,0,1,1,1,1,0,0
##D          ,0,0,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0),7,byrow=TRUE),
##D          nstate=7,state_label=c("diagnose","cp1","ap","cp2","bc","sct","death"),
##D          event_label=c("cp1.s","ap.s","cp2.s","bc.s","sct.s","death.s"),
##D          treatment=c("sct","sct.s"),absorb=c("death","death.s"),
##D          cov=c("age"),cov_value=c(0))
##D 
##D ## compare different treatment strategies
##D sim.MTL(obj=fit,nsim=1000,L=120)
##D 
##D ##################################
##D ## Example 2: This example shows how to obtain mean total lifetime
##D ## for a given state
##D 
##D ## read data
##D data(SimCml)
##D 
##D ## delete the information of transplant time
##D data=SimCml[SimCml$sct.s==0,]
##D del=which(names(SimCml)%in%c("sct","sct.s"))
##D data=data[,-del]
##D 
##D ## fit multistate model with treatment equals NULL
##D fit=optim.fit(data=data,
##D         transM=matrix(c(0,1,0,0,0,0,0,0,1,0,1,1,0,0,0,1,
##D         1,1,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0),6,byrow=TRUE),
##D         nstate=6,state_label=c("diagnose","cp1","ap","cp2","bc","death"),
##D         absorb=c("death","death.s"),
##D         event_label=c("cp1.s","ap.s","cp2.s","bc.s","death.s"),
##D         cov=c("age"),cov_value=c(0))
##D 
##D ## calculate mean total lifetime when the initiate state is cp1 or ap
##D sim.MTL(obj=fit,state=c(2,3),nsim=1000,L=120)
## End(Not run)

## Don't show: 
library(OptimalTiming)
data(SimCml)
SimCml=SimCml[SimCml$sct.s==0,]
SimCml=SimCml[,c(1,2,3,4,11,12,13,14)]
fit=optim.fit(data=SimCml,
         transM=matrix(c(0,1,1,1,0,0,1,1,0,0,0,1,0,0,0,0),4,byrow=TRUE),
         nstate=4,state_label=c("diagnose","cp1","ap","death"),
         event_label=c("cp1.s","ap.s","death.s"),
         absorb=c("death","death.s"),
         cov=c("age"),cov_value=c(0))
sim.MTL(obj=fit,state=c(2,3),nsim=1000,L=120)


data(SimCml)
SimCml=SimCml[,c(1,2,9,10,11,12,13,14)]
fit=optim.fit(data=SimCml,
         transM=matrix(c(0,1,1,1,0,0,1,1,0,0,0,1,0,0,0,0),4,byrow=TRUE),
         nstate=4,state_label=c("diagnose","cp1","sct","death"),
         event_label=c("cp1.s","sct.s","death.s"),
         treatment=c("sct","sct.s"),absorb=c("death","death.s"),
         cov=c("age","sex"),cov_value=c(0,1))
sim.MTL(obj=fit,nsim=1000,L=120)
## End(Don't show)




