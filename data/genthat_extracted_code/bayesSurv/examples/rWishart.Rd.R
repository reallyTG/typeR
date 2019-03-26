library(bayesSurv)


### Name: rWishart
### Title: Sample from the Wishart distribution
### Aliases: rWishart C_rwishartR3
### Keywords: distribution multivariate

### ** Examples

### The same as rgamma(n, shape=df/2, rate=1/(2*S))
n <- 1000
df <- 1
S  <- 3
w <- rWishart(n=n, df=df, S=S)
mean(w)    ## should be close to df*S
var(w)     ## should be close to 2*df*S^2

### Multivariate Wishart
n <- 1000
df <- 2
S <- matrix(c(1,3,3,13), nrow=2)
w <- rWishart(n=n, df=df, S=S)
apply(w, 2, mean)                ## should be close to df*S
df*S

df <- 2.5
S <- matrix(c(1,2,3,2,20,26,3,26,70), nrow=3)
w <- rWishart(n=n, df=df, S=S)
apply(w, 2, mean)                ## should be close to df*S
df*S



