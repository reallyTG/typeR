library(ldhmm)


### Name: ldhmm
### Title: Constructor of ldhmm class
### Aliases: ldhmm
### Keywords: constructor

### ** Examples

param0 <- matrix(c(0.003, 0.02, 1, -0.006, 0.03, 1.3), 2, 3, byrow=TRUE)
gamma0 <- matrix(c(0.9, 0.1, 0.1, 0.9), 2, 2, byrow=TRUE)
d <- ldhmm(m=2, param=param0, gamma=gamma0)




