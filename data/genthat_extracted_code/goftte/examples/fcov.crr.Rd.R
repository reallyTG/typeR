library(goftte)


### Name: fcov.crr
### Title: Checking the functional form assumption for Fine & Gray model
### Aliases: fcov.crr

### ** Examples

require(cmprsk)

#Simulating survival data with competing events
set.seed(10)
ftime <- rexp(200)
fstatus <- sample(0:2,200,replace=TRUE)
cov <- matrix(runif(200),nrow=200)

# Fine & Gray regression
fit.crr <- crr(ftime,fstatus,cov)

#Checking the covariates functional form assumption
fcov(model=fit.crr, ftime=ftime,fstatus=fstatus,cov1=cov)
       


