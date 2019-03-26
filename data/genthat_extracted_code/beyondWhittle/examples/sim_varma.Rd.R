library(beyondWhittle)


### Name: sim_varma
### Title: Simulate from a VARMA model
### Aliases: sim_varma

### ** Examples

## Not run: 
##D # Example: Draw from bivariate normal VAR(2) model
##D ar <- rbind(c(.5, 0, 0, 0), c(0, -.3, 0, -.5))
##D Sigma <- matrix(data=c(1, .9, .9, 1), nrow=2, ncol=2)
##D x <- sim_varma(n=256, d=2, model=list(ar=ar))
##D plot.ts(x)
## End(Not run)



