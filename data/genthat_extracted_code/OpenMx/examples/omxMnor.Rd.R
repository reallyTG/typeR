library(OpenMx)


### Name: omxMnor
### Title: Multivariate Normal Integration
### Aliases: omxMnor

### ** Examples


data(myFADataRaw)

covariance <- cov(myFADataRaw[,1:3])
means <- colMeans(myFADataRaw[,1:3])
lbound <- c(-Inf, 0,   1)    # Integrate from -Infinity to 0 on first variable 
ubound <- c(0,    Inf, 2.5)  # From 0 to +Infinity on second, and from 1 to 2.5 on third
omxMnor(covariance, means, lbound, ubound)
# 0.0005995

# An alternative specification of the bounds follows
# Integrate from -Infinity to 0 on first variable 
v1bound = c(-Inf, 0)
# From 0 to +Infinity on second
v2bound = c(0, Inf)
# and from 1 to 2.5 on third
v3bound = c(1, 2.5)
bounds <- cbind(v1bound, v2bound, v3bound)
lbound <- bounds[1,]  
ubound <- bounds[2,]  
omxMnor(covariance, means, lbound, ubound)




