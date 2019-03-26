library(miscF)


### Name: curve.polynomial.rjmcmc
### Title: Curve Fitting Using Piecewise Polynomials with Unknown Number
###   and Location of Knots
### Aliases: curve.polynomial.rjmcmc
### Keywords: smooth

### ** Examples

## Not run: 
##D    #Example 1: smooth curve
##D    #example 3.1. (b) in Denison et al.(1998)
##D 
##D    x <- runif(200)
##D    xx <- -2 + 4*x
##D    y.truth <- sin(2*xx) + 2*exp(-16*xx^2)
##D    y <- y.truth + rnorm(200, mean=0, sd=0.3)
##D 
##D    results <- curve.polynomial.rjmcmc(y, x, lambda=1, l=2, l0=1)
##D 
##D    plot(sort(x), y.truth[order(x)], type="l")
##D    lines(sort(x), rowMeans(results$fitted.save), col="red")
##D 
##D    #Example 2: unsmooth curve
##D    #blocks in Denison et al.(1998)
##D    tj <- c(0.1, 0.13, 0.15, 0.23, 0.25, 0.4, 0.44, 0.65, 0.76, 0.78, 0.81)
##D    hj <- c(4, -5, 3, -4, 5, -4.2, 2.1, 4.3, -3.1, 2.1, -4.2)
##D 
##D    t <- seq(0, 1, len=2048)
##D    Ktmtj <- outer(t, tj, function(a,b) ifelse(a-b > 0, 1, -1))
##D    ft <- rowSums(Ktmtj %*% diag(hj))
##D    x <- t
##D    y <- ft + rnorm(2048, 0, 1)
##D 
##D    results <- curve.polynomial.rjmcmc(y, x, lambda=5, l=2, l0=1)
##D 
##D    plot(x, ft, type="s")
##D    lines(x, rowMeans(results$fitted.save), col="red")
##D 
##D    #Example 3: unsmooth curve
##D    #bumps in Denison et al.(1998)
##D    tj <- c(0.1, 0.13, 0.15, 0.23, 0.25, 0.4, 0.44, 0.65, 0.76, 0.78, 0.81)
##D    hj <- c(4, 5, 3, 4, 5, 4.2, 2.1, 4.3, 3.1, 5.1, 4.2)*10
##D    wj <- c(0.005, 0.005, 0.006, 0.01, 0.01, 0.03, 0.01, 0.01, 0.005, 0.008, 0.005)
##D 
##D    t <- seq(0, 1, len=2048)
##D    ft <- rowSums((1 + abs(outer(t, tj ,"-") %*% diag(1/wj)))^(-4) %*% diag(hj))
##D    y <- ft + rnorm(2048, 0, 1)
##D 
##D    results <- curve.polynomial.rjmcmc(y, t, lambda=5, l=2, l0=1)
##D 
##D    plot(t, ft, type="s")
##D    lines(t, rowMeans(results$fitted.save), col="red")
##D   
## End(Not run)



