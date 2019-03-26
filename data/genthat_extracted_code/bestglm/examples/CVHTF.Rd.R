library(bestglm)


### Name: CVHTF
### Title: K-fold Cross-Validation
### Aliases: CVHTF
### Keywords: models regression

### ** Examples

#Example 1. 10-fold CV
data(zprostate)
train<-(zprostate[zprostate[,10],])[,-10]
X<-train[,1:2]
y<-train[,9]
CVHTF(X,y,K=10,REP=1)[1]



