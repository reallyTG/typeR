library(ICC.Sample.Size)


### Name: calculateIccPower
### Title: Function to calculate post-hoc power for ICC studies
### Aliases: calculateIccPower

### ** Examples

##Calculate post-hoc power for p=0.80, p0=0.60, k=2, alpha=0.05, tails=2 and N of 30.
calculateIccPower(p=0.80,p0=0.60,k=2,alpha=0.05,tails=2,N=30)
##Calculate post-hoc power for p=0.80, p0=0.60, k=2, alpha=0.05, tails=2 and N of 30.
##Test effect on power of increasing sample size in steps of 1 up until a maximum of 50
##with a desired power of 0.80.
calculateIccPower(p=0.80,p0=0.60,k=2,alpha=0.05,tails=2,N=30, by="N",desiredPower=0.80,maxN=50)
##alculate post-hoc power for p=0.80, p0=0.60, k=2, alpha=0.05, tails=2 and N of 30.
##Calculate the sample size need to increase power by
##steps of 0.05 up until a maximum sample size of 50 with a desired power of 0.80.
calculateIccPower(p=0.80,p0=0.60,k=2,alpha=0.05,tails=2,N=30, by="power",desiredPower=0.80,maxN=50)



