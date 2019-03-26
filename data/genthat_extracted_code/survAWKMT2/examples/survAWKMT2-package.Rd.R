library(survAWKMT2)


### Name: survAWKMT2-package
### Title: Two-Sample Tests Based on Weighted Differences of Kaplan-Meier
###   Curves
### Aliases: survAWKMT2-package

### ** Examples

D        = survival::pbc[1:312, c(2,3,4)] #The pbc data from 'survival' package
D$status = as.numeric(D$status==2)
D$trt    = as.numeric(D$trt==2)
names(D) = c("time", "status", "arm")
tau      = max(D[D[,2]==1,1])
nmethod  = 10 #Recommended to specify at least 10000 (default) or larger.

a = AWKMT2(indata=D, tau=tau, c_first=0, c_last=4, c_by=0.1, method="permutation",
           nmethod=nmethod, seed=1, v1=TRUE, v2=TRUE, test="1_side")
print(a)



