library(extremis)


### Name: kgvar
### Title: K-Geometric Means Algorithm for Value-at-Risk
### Aliases: kgvar kgvar.default

### ** Examples

## Not run: 
##D ## Example (Overlapping version of Fig. 8 in Supplementary Materials)
##D data(lse)
##D attach(lse)
##D y <- -apply(log(lse[, -1]), 2, diff) 
##D fit <- kgvar(y, centers = 3)
##D plot(fit, c.c = TRUE, ylim = c(0, 0.1))
## End(Not run)



