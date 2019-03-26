library(mvc)


### Name: estLogPxCatGthetaJ
### Title: Estimate log document probabilites given specific Categorical
###   parameters...
### Aliases: estLogPxCatGthetaJ

### ** Examples
{
X=matrix(c(1,2,1,1,1,1,2,1),2,4,byrow=TRUE) # two documents of length 4
prob=matrix(c(.9,.8,.9,.9,.1,.2,.1,.1),4,2) # prob per index
dput(mApplyCat(X,prob)) # likelihood for each index
#structure(c(0.9, 0.9, 0.2, 0.8, 0.9, 0.1, 0.9, 0.9), .Dim = c(2L, 4L))
dput(estLogPxCatGthetaJ(X,log(prob))) 
# c(-1.92551945940758, -2.73644967562391)
}


