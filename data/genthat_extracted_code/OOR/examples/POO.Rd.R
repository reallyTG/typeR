library(OOR)


### Name: POO
### Title: Parallel Optimistic Optimization
### Aliases: POO

### ** Examples

## Not run: 
##D #------------------------------------------------------------
##D # Maximization with POO
##D #------------------------------------------------------------
##D set.seed(10)
##D noise.level <- 0.05
##D 
##D ## Define and display objective
##D ftest <- function(x){return(double_sine(x) + runif(1, min = -noise.level, max = noise.level))}
##D xgrid <- seq(0, 1, length.out = 1000)
##D plot(xgrid, sapply(xgrid, double_sine), type = 'l', ylab = "double_sine(x)", xlab = 'x')
##D 
##D ## Optimization
##D Sol <- POO(ftest, horizon = 1000, noise.level = noise.level)
##D 
##D ## Display result
##D abline(v = Sol$par)
## End(Not run)



