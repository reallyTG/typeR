library(coneproj)


### Name: coneB
### Title: Cone Projection - Constraint Cone
### Aliases: coneB
### Keywords: cone projection routines

### ** Examples

# generate y
    set.seed(123)
    n <- 50
    x <- seq(-2, 2, length = 50)
    y <- - x^2 + rnorm(n)

# create the edges of the constraint cone to make the first half of y monotonically increasing 
# and the second half of y monotonically decreasing    
    amat <- matrix(0, n - 1, n)
    for(i in 1:(n/2 - 1)){
       amat[i, i] <- -1; amat[i, i + 1] <- 1
    }
    for(i in (n/2):(n - 1)){
       amat[i, i] <- 1; amat[i, i + 1] <- -1
    }

# note that in coneB, the transpose of the edges of the constraint cone is provided
    delta <- crossprod(amat, solve(tcrossprod(amat)))
    
# make the basis of V
    vmat <- matrix(rep(1, n), ncol = 1)

# call coneB
    ans3 <- coneB(y, delta, vmat)
    ans4 <- coneB(y, delta, vmat, w = (1:n)/n)

# make a plot to compare the unweighted fit and weighted fit
    par(mar = c(4, 4, 1, 1))
    plot(y, cex = .7, ylab = "y")
    lines(fitted(ans3), col = 2, lty = 2)
    lines(fitted(ans4), col = 4, lty = 2)
    legend("topleft", bty = "n", c("unweighted fit", "weighted fit"), col = c(2, 4), lty = c(2, 2))
    title("ConeB Example Plot")



