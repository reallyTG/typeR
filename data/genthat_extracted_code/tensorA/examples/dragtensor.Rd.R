library(tensorA)


### Name: drag.tensor
### Title: Managing covariate and contravariate indices
### Aliases: drag.tensor is.covariate is.covariate.tensor
###   is.covariate.numeric is.covariate.character is.contravariate
###   is.contravariate.tensor is.contravariate.numeric
###   is.contravariate.character contraname as.covariate as.contravariate
###   as.covariate.character as.contravariate.character
### Keywords: arith

### ** Examples

g <- to.tensor(c(1,2,0,1),c(i=2,j=2))
A <- to.tensor(rnorm(8),c(a=2,b=2,c=2))
A2 <- drag.tensor(A,g,c("b","c"))
A2
names(A2)
as.covariate(names(A2))
as.contravariate(names(A2))
is.covariate(A2)
is.contravariate(A2)
riemann.tensor(A2,g)




