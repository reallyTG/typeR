library(OptSig)


### Name: Opt.SigBoot
### Title: Optimal Significance Level for the F-test using the bootstrap
### Aliases: Opt.SigBoot
### Keywords: htest

### ** Examples


data(data1)
# Define Y and X
y=data1$lnoutput; x=cbind(data1$lncapital,data1$lnlabor)

# Restriction matrices to test for constant returns to scale
Rmat=matrix(c(0,1,1),nrow=1); rvec=matrix(0.94,nrow=1)

Opt.SigBoot(y,x,Rmat,rvec,p=0.5,k=1,nboot=2000,Figure=TRUE)




