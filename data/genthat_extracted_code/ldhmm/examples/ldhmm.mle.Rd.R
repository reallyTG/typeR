library(ldhmm)


### Name: ldhmm.mle
### Title: Computing the MLEs
### Aliases: ldhmm.mle
### Keywords: mle

### ** Examples

## Not run: 
##D     param0 <- matrix(c(0.003, 0.02, 1, -0.006, 0.03, 1.3), 2, 3, byrow=TRUE)
##D     gamma0 <- ldhmm.gamma_init(m=2, prob=c(0.9, 0.1, 0.1, 0.9))
##D     h <- ldhmm(m=2, param=param0, gamma=gamma0)
##D     spx <- ldhmm.ts_log_rtn()
##D     ldhmm.mle(h, spx$x)
## End(Not run)



