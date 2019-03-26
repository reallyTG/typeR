library(DunnettTests)


### Name: DunnettTests-package
### Title: R implementation of step-down and step-up Dunnett test
###   procedures
### Aliases: DunnettTests-package DunnettTests
### Keywords: package step-down Dunnett step-up Dunnett critical value
###   adjusted P-value testing power sample size

### ** Examples

#critical constants 
cvSDDT(k=4,alpha=0.05,alternative="U",corr=0.5,df=30)
cvSUDT(k=4,alpha=0.05,alternative="U",corr=0.5,df=30)

#adjusted P-values
qvSDDT(teststats=c(2.20,1.47,2.00),alternative="B",corr=0.5,df=30)
## Not run: 
##D qvSUDT(teststats=c(2.20,1.47,2.00),alternative="B",corr=0.5,df=30)
## End(Not run)

#testing power of SU Dunnett to reject at least one false null
powDT(1,4,mu=22,mu0=20,n=100,n0=80,"means",sigma=5,alpha=0.025,testcall="SU")

#sample size to achieve at least 90% power of rejecting all the 
#false nulls for step-down Dunnett test procedure
## Not run: 
##D nvDT(1,0.90,r=4,k=4,mu=0.7,mu0=0.5,"props",dist="zdist",testcall="SD")
## End(Not run)



