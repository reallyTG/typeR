library(OptimalTiming)


### Name: optim.fit
### Title: Fit multi-state model for optimization
### Aliases: optim.fit

### ** Examples


## Not run: 
##D library(OptimalTiming)
##D ## read data
##D data(SimCml)
##D 
##D ## fit multistate model if the time to new treatment initiation is available in SimCml
##D fit=optim.fit(data=SimCml,
##D          transM=matrix(c(0,1,0,0,0,1,0,0,0,1,0,1,1,1,0,0,0,1,1,1,1,
##D          0,0,0,0,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0),7,byrow=TRUE),
##D          nstate=7,state_label=c("diagnose","cp1","ap","cp2","bc","sct","death"),
##D          event_label=c("cp1.s","ap.s","cp2.s","bc.s","sct.s","death.s"),
##D          treatment=c("sct","sct.s"),absorb=c("death","death.s"),
##D          cov=c("age"),cov_value=c(0))
##D 
##D ## view the content of this object
##D objects(fit)
##D 
##D ## output transition probabilities
##D fit$treat$tranProb
##D fit$no_treat$tranProb
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


data(SimCml)
SimCml=SimCml[,c(1,2,9,10,11,12,13,14)]
fit=optim.fit(data=SimCml,
         transM=matrix(c(0,1,1,1,0,0,1,1,0,0,0,1,0,0,0,0),4,byrow=TRUE),
         nstate=4,state_label=c("diagnose","cp1","sct","death"),
         event_label=c("cp1.s","sct.s","death.s"),
         treatment=c("sct","sct.s"),absorb=c("death","death.s"),
         cov=c("age","sex"),cov_value=c(0,1))
## End(Don't show)



