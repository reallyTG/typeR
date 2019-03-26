library(cap)


### Name: capReg
### Title: Covariate Assisted Principal Regression for Covariance Matrix
###   Outcomes
### Aliases: capReg
### Keywords: models

### ** Examples


#############################################
data(env.example)
X<-get("X",env.example)
Y<-get("Y",env.example)

# method = "CAP"
# without orthogonal constraint
re1<-capReg(Y,X,nD=2,method=c("CAP"),CAP.OC=FALSE)
# with orthogonal constraint
re2<-capReg(Y,X,nD=2,method=c("CAP"),CAP.OC=TRUE)

# method = "CAP-C"
re3<-capReg(Y,X,nD=2,method=c("CAP-C"))
#############################################



