library(AlgDesign)


### Name: optMonteCarlo
### Title: Optimal design via Monte Carlo
### Aliases: optMonteCarlo
### Keywords: design

### ** Examples


# EXAMPLE 1
# The data.frame in data might look like the following:
data<-data.frame(var=paste("X",1:6,sep=""),low=c(1,1,1,0,0,0),
high=c(3,3,3,1,1,1),center=c(2,2,2,0,0,0),nLevels=3,
round=1,factor=0,mix=c(FALSE,FALSE,FALSE,TRUE,TRUE,TRUE))
data

# and the design:

optMonteCarlo(~(X1+X2+X3)^2+X4+X5+X6,data)

# Example 2
# Standard designs will often be produced, just as 
# they will with optFederov(). For example,
# a half fraction of a 2^4:
data<-data.frame(paste("X",1:4,sep=""),-1,1,0,2,0,0)
data
optMonteCarlo(~.,data,nTrials=8)

# Example 3
# optMonteCarlo() can treat much larger problems than can 
# optFederov().  For example, optFederov()
# requires a candidate list of 3^20 points for
# a 20 variable, 3 level candidate list -- about
# 25 gigabytes. If the model is quadratic, this must
# be multiplied by about 12. There are other storage
# requirements internal to optFederov() which easily
# double this value. optMonteCarlo() since it only samples
# from the putative candidate list, has no difficulty 
# with a problem of this size. The criterion values
# appearing in the output of optMonteCarlo() are based on
# these samples, but their values seem to be reasonable
# correct, as the following shows: (These are commented
# out for those who have a slow machine.)

dat<-gen.factorial(levels=3,nVar=8)
#desF<-optFederov(~quad(.),dat,eval=TRUE)
#desF[1:5]

data<-data.frame(paste("X",1:8,sep=""),-1,1,0,3,0,0)
#desH<-optMonteCarlo(~quad(.),data,Rand=FALSE,eval=TRUE)
#desH[1:5]

# The following is a 20 variable quadratic. Uncomment
# and wait a while, even if you have a fast machine.
# Note: nRepeats has been changed from its default.
# Note: criterion values for exact designs are often
# far from approximate theory optima; hence, Ge and De
# will be small.

data<-data.frame(paste("X",1:20,sep=""),-1,1,0,3,0,0)
#desBig<-optMonteCarlo(~quad(.),data,nRepeats=1)

# The following will produce improved criterion values

#desNBig<-optMonteCarlo(~quad(.),data,Rand=FALSE,nRepeats=1)

# EXAMPLE 4
# Practically infeasible combinations of variable are 
# common. Designs may be produced which avoid such
# combinations by using a constraint function. Suppose,
# for example that one corner of a cubic box is not
# feasible, then the following will produce a design
# that makes no use of this corner.

Constraints<-function(x){!(x[1]>0.75 && x[2]>0.75)}
data<-data.frame(paste("X",1:4,sep=""),-1,1,0,3,0,0)
desC<-optMonteCarlo(~.,data,con=Constraints)

# The above just removes a corner. Increasing the
# number of levels will remove points along the
# boundary.

data<-data.frame(paste("X",1:4,sep=""),-1,1,0,11,3,0)
desC2<-optMonteCarlo(~.,data,con=Constraints)




