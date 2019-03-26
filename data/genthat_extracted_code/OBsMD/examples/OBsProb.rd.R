library(OBsMD)


### Name: OBsProb
### Title: Objective Posterior Probabilities from Bayesian Screening
###   Experiments
### Aliases: OBsProb
### Keywords: design

### ** Examples

library(OBsMD)
data(OBsMD.es5, package="OBsMD")
X <- as.matrix(OBsMD.es5[,1:5])
y <- OBsMD.es5[,6]
# Using for model prior probability a Beta with parameters a=1 b=1
es5.OBsProb <- OBsProb(X=X,y=y, abeta=1, bbeta=1, blk=0,mFac=5,mInt=2,nTop=32)
print(es5.OBsProb)
summary(es5.OBsProb)



