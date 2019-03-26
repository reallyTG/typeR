library(goftte)


### Name: print.scproc
### Title: Printing method for 'scproc' objects
### Aliases: print.scproc

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
k<-fcov(model=fit.crr, ftime=ftime,fstatus=fstatus,cov1=cov)

#Summary of covariates functional form assumption diagnostics
print(k)



