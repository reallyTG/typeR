library(adagio)


### Name: CMAES
### Title: Covariance Matrix Adaptation Evolution Strategy
### Aliases: pureCMAES
### Keywords: optimize

### ** Examples

## Not run: 
##D ##  Polynomial minimax approximation of data points
##D ##  (see the Remez algorithm)
##D n <- 10; m <- 101           # polynomial of degree 10; no. of data points
##D xi <- seq(-1, 1, length = m)
##D yi <- 1 / (1 + (5*xi)^2)    # Runge's function
##D 
##D pval <- function(p, x)      # Horner scheme
##D     outer(x, (length(p) - 1):0, "^") %*% p
##D 
##D pfit <- function(x, y, n)   # polynomial fitting of degree n
##D     qr.solve(outer(x, seq(n, 0), "^"), y)
##D 
##D fn1 <- function(p)           # objective function
##D     max(abs(pval(p, xi) - yi))
##D 
##D pf <- pfit(xi, yi, 10)      # start with a least-squares fitting
##D sol1 <- pureCMAES(pf, fn1, rep(-200, 11), rep(200, 11))
##D zapsmall(sol1$xmin)
##D # [1]  -50.24826    0.00000  135.85352    0.00000 -134.20107    0.00000
##D # [7]   59.19315    0.00000  -11.55888    0.00000    0.93453
##D 
##D print(sol1$fmin, digits = 10)
##D # [1] 0.06546780411
##D 
##D ##  Polynomial fitting in the L1 norm
##D ##  (or use LP or IRLS approaches)
##D fn2 <- function(p)
##D     sum(abs(pval(p, xi) - yi))
##D 
##D sol2 <- pureCMAES(pf, fn2, rep(-100, 11), rep(100, 11))
##D zapsmall(sol2$xmin)
##D # [1] -21.93238   0.00000  62.91083   0.00000 -67.84847   0.00000 
##D # [7]  34.14398   0.00000  -8.11899   0.00000   0.84533
##D 
##D print(sol2$fmin, digits = 10)
##D # [1] 3.061810639
## End(Not run)



