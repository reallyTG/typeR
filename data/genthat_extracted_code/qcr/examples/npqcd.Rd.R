library(qcr)


### Name: npqcd
### Title: It creates a data object for Non Parametric Quality Control
### Aliases: npqcd

### ** Examples


library(qcr)

set.seed(356)
data <- matrix(rnorm(999), nc = 3)
x <-rexp(999,0.5) 
x <-matrix(x,ncol=3) 
data.npqcd <- npqcd(data,x)
str(data.npqcd)



