library(coneproj)


### Name: coneA
### Title: Cone Projection - Polar Cone
### Aliases: coneA

### ** Examples

# generate y
    set.seed(123)
    n <- 50
    x <- seq(-2, 2, length = 50)
    y <- - x^2 + rnorm(n)

# create the constraint matrix to make the first half of y monotonically increasing
# and the second half of y monotonically decreasing
    amat <- matrix(0, n - 1, n)
    for(i in 1:(n/2 - 1)){
       amat[i, i] <- -1; amat[i, i + 1] <- 1
    }
    for(i in (n/2):(n - 1)){
       amat[i, i] <- 1; amat[i, i + 1] <- -1
    }

# call coneA
    ans1 <- coneA(y, amat)
    ans2 <- coneA(y, amat, w = (1:n)/n)

# make a plot to compare the unweighted fit and the weighted fit
    par(mar = c(4, 4, 1, 1))
    plot(y, cex = .7, ylab = "y")
    lines(fitted(ans1), col = 2, lty = 2)
    lines(fitted(ans2), col = 4, lty = 2)
    legend("topleft", bty = "n", c("unweighted fit", "weighted fit"), col = c(2, 4), lty = c(2, 2))
    title("ConeA Example Plot")  



