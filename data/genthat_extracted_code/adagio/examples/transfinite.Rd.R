library(adagio)


### Name: transfinite
### Title: Boxed Region Transformation
### Aliases: transfinite
### Keywords: manip

### ** Examples

lower <- c(-Inf, 0,   0)
upper <- c( Inf, 0.5, 1)
Tf <- transfinite(lower, upper)
h <- Tf$h; hinv <- Tf$hinv

## Not run: 
##D ##  Solve Rosenbrock with one variable restricted
##D rosen <- function(x) {
##D     n <- length(x)
##D     x1 <- x[2:n]; x2 <- x[1:(n-1)]
##D     sum(100*(x1-x2^2)^2 + (1-x2)^2)
##D }
##D f  <- function(x) rosen(hinv(x))    # f must be defined on all of R^n
##D x0 <- c(0.1, 0.1, 0.1)              # starting point not on the boundary!
##D nm <- nelder_mead(h(x0), f)         # unconstraint Nelder-Mead
##D hinv(nm$xmin); nm$fmin              # box/bound constraint solution
##D # [1] 0.7085596 0.5000000 0.2500004
##D # [1] 0.3353605
## End(Not run)



