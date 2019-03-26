library(EMMIXuskew)


### Name: rfmmst
### Title: Simulation of Mixture Data
### Aliases: rfmmst rmst
### Keywords: random number multivariate skew t multivariate distribution

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
rfmmst(1,500, c(1,2), diag(2), c(-1,1), 4, 1)
obj <- list()
obj$mu <- list(c(17,19), c(5,22), c(6,10))
obj$sigma <- list(diag(2), matrix(c(2,0,0,1),2), matrix(c(3,7,7,24),2))
obj$delta <- list(c(3,1.5), c(5,10), c(2,0))
obj$dof <- c(1, 2, 3)
obj$pro <- c(0.25, 0.25, 0.5)
rfmmst(3, 250, obj$mu, obj$sigma, obj$delta, obj$dof, obj$pro)
rfmmst(3, 500, known=obj)



