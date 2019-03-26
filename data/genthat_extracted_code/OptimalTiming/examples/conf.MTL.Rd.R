library(OptimalTiming)


### Name: conf.MTL
### Title: Confidence interval of mean total lifetime
### Aliases: conf.MTL

### ** Examples


## Not run: 
##D library(OptimalTiming)
##D 
##D ##################################
##D ## Example 1: This example shows how to calculate confidence
##D ## intervals for different treatment strategies
##D 
##D ## read data
##D data(SimCml)
##D 
##D ## fit multistate model with treatment not equals NULL
##D fit=optim.fit(data=SimCml,
##D        transM=matrix(c(0,1,0,0,0,1,0,0,0,1,0,1,1,1,0,0,0,1,1,1,1,
##D        0,0,0,0,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0),7,byrow=TRUE),
##D        nstate=7,state_label=c("diagnose","cp1","ap","cp2","bc","sct","death"),
##D        event_label=c("cp1.s","ap.s","cp2.s","bc.s","sct.s","death.s"),
##D        treatment=c("sct","sct.s"),absorb=c("death","death.s"),
##D        cov=c("age"),cov_value=c(0))
##D 
##D ## compare different treatment strategies
##D conf.MTL(obj=fit,nsim=1000,L=120)
##D 
##D ##################################
##D ## Example 2: This example shows how to calculate confidence
##D ## intervals for a given state
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
##D         transM=matrix(c(0,1,0,0,0,0,0,0,1,0,1,1,0,0,0,
##D         1,1,1,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0),6,byrow=TRUE),
##D         nstate=6,state_label=c("diagnose","cp1","ap","cp2","bc","death"),
##D         absorb=c("death","death.s"),event_label=c("cp1.s","ap.s","cp2.s","bc.s","death.s"),
##D         cov=c("age"),cov_value=c(0))
##D 
##D ## calculate mean total lifetime and confidence intervals
##D ## for state 1,2,3,4
##D conf.MTL(obj=fit,state=c(1,2,3,4),nsim=1000,L=120)
## End(Not run)






