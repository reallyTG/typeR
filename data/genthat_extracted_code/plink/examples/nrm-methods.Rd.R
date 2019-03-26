library(plink)


### Name: nrm-methods
### Title: Nominal Response Model Probabilities
### Aliases: nrm nrm-methods nrm,matrix,numeric-method
###   nrm,data.frame,numeric-method nrm,list,numeric-method
###   nrm,irt.pars,ANY-method nrm,sep.pars,ANY-method
### Keywords: methods distribution

### ** Examples

###### Unidimensional Example ######
## Item parameters from Bock (1972, p. 46,47)
a <- matrix(c(.905, .522, -.469, -.959, NA, 
  .828, .375, -.357, -.079, -.817), 2,5,byrow=TRUE)
c <- matrix(c(.126, -.206, -.257, .336, NA, 
  .565, .865, -1.186, -1.199, .993), 2,5,byrow=TRUE)
pars <- cbind(a,c)
x <- nrm(pars, c(4,5))
plot(x,auto.key=list(space="right"))

###### Multidimensional Example ######
# From Bolt & Johnson (in press)
pars <- matrix(c(-1.28, -1.029, -0.537, 0.015, 0.519, 0.969, 1.343,
1.473, -0.585, -0.561, -0.445, -0.741, -0.584, 1.444,
0.29, 0.01, 0.04, 0.34, 0, -0.04, -0.63), 1,21)
x <- nrm(pars, cat=7, dimensions=2)
# Plot separated surfaces
plot(x,separate=TRUE,drape=TRUE)



