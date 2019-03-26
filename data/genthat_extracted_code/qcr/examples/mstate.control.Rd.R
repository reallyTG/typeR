library(qcr)


### Name: mstate.control
### Title: Multivariate process state
### Aliases: mstate.control

### ** Examples


##
##  Continuous data 
##
library(qcr)
set.seed(356)
x <- matrix(rnorm(66),ncol=3)
x <- rbind(x,matrix(rexp(66,100),ncol=3))
dim(x)
x <-mqcd(x)
str(x)
x <-mqcs.mewma(x)
str(x)
plot(x)
data.mqcs <- mstate.control(x)
x <-mqcs.mewma(data.mqcs)
plot(x)



