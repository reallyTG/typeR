library(JADE)


### Name: multscatter
### Title: Function to Compute Several Scatter Matrices for the Same Data
### Aliases: multscatter
### Keywords: multivariate

### ** Examples

# example requires the packages ICS and ICSNP
library(ICSNP)
X <- cbind(rexp(1000), rt(1000,6), runif(1000)) 

my.tM1 <- function(X,df=1) tM(X,)$V
my.tM2 <- function(X,df=2) tM(X,)$V

multscatter(c("cov","cov4","HP1.shape","my.tM1", "my.tM2"), X)
multscatter(c("cov","cov4","HP1.shape","my.tM1", "my.tM2"), X, toshape=FALSE)



