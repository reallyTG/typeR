library(GRS.test)


### Name: GRS.optimalbootweight
### Title: Weighted Optimal Level of Significance for the GRS test:
###   Bootstrapping
### Aliases: GRS.optimalbootweight
### Keywords: htest

### ** Examples

data(data)
n=60; m1=nrow(data)-n+1; m2=nrow(data)   # Choose the last n observations from the data set
factor.mat = data[m1:m2,2:6]            # Fama-French 5-factors
ret.mat = data[m1:m2,8:ncol(data)]      # 25 size-BM portfolio returns
GRS.optimalboot(ret.mat,factor.mat,p=0.5,k=1,nboot=500,wild=TRUE,Graph=TRUE)




