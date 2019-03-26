library(tseriesEntropy)


### Name: Srho.test
### Title: Entropy Test For Serial And Cross Dependence For Categorical
###   Sequences
### Aliases: Srho.test
### Keywords: ts

### ** Examples

set.seed(12)
x <- as.integer(rbinom(n=30,size=4,prob=0.5))
y <- as.integer(rbinom(n=30,size=4,prob=0.5))
z <- as.integer(c(4,abs(x[-30]*2-2))-rbinom(n=30,size=1,prob=1/2))

# no dependence
Srho.test(x,lag.max=4)   # univariate
Srho.test(x,y,lag.max=4) # bivariate

# lag 1 dependence
Srho.test(x,z,lag.max=4) # bivariate



