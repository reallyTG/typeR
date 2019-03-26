library(goftte)


### Name: prop.crr
### Title: Checking proportional subdistribution hazard assumption for Fine
###   & Gray model
### Aliases: prop.crr

### ** Examples

require(cmprsk)

#Simulating survival data with competing events
set.seed(10)
ftime <- rexp(200)
fstatus <- sample(0:2,200,replace=TRUE)
cov <- matrix(runif(200),nrow=200)

# Fine & Gray regression
fit.crr <- crr(ftime,fstatus,cov)

#Checking the proportional subdistribution hazards assumption
prop(model=fit.crr, ftime=ftime,fstatus=fstatus,cov1=cov)



