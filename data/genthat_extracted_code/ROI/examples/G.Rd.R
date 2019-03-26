library(ROI)


### Name: G
### Title: Extract Gradient information
### Aliases: G

### ** Examples

## Not run: 
##D    f <- function(x) {
##D        return( 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2 )
##D    }
##D    x <- OP( objective = F_objective(f, n=2L), 
##D             bounds = V_bound(li=1:2, ui=1:2, lb=c(-3, -3), ub=c(3, 3)) )
##D    G(objective(x))(c(0, 0)) ## gradient numerically approximated by numDeriv
##D 
##D 
##D    f.gradient <- function(x) {
##D        return( c( -400 * x[1] * (x[2] - x[1] * x[1]) - 2 * (1 - x[1]),
##D                    200 * (x[2] - x[1] * x[1])) )
##D    }
##D    x <- OP( objective = F_objective(f, n=2L, G=f.gradient), 
##D             bounds = V_bound(li=1:2, ui=1:2, lb=c(-3, -3), ub=c(3, 3)) )
##D    G(objective(x))(c(0, 0)) ## gradient calculated by f.gradient
## End(Not run)



