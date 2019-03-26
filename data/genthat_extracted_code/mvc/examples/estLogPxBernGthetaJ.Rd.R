library(mvc)


### Name: estLogPxBernGthetaJ
### Title: Estimate log document probabilites given specific Bernoulli
###   parameters...
### Aliases: estLogPxBernGthetaJ

### ** Examples
{
X=matrix(c(0,1,0,0,0,0,1,0),2,4,byrow=TRUE) # two documents of length 4
prob=c(.1,.2,.1,.1) # prob per index
dput(mApplyBern(X,prob)) # likelihood for each index
#structure(c(0.9, 0.9, 0.2, 0.8, 0.9, 0.1, 0.9, 0.9), .Dim = c(2L, 4L))
dput(estLogPxBernGthetaJ(X,log(prob))) 
# c(-1.92551945940758, -2.73644967562391)
}


