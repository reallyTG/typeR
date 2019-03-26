library(mQTL)


### Name: selectRefSp
### Title: Automated selection of a reference spectrum
### Aliases: selectRefSp
### Keywords: function

### ** Examples


# Data

Sp=matrix(rnorm(10*13454,mean=0,sd=1), nrow=10,ncol=13454)

# Reference spectrum selection

step=0.02 # Recursion step (default 0.02)
index<-selectRefSp(Sp,step)




