library(coneproj)


### Name: qprog
### Title: Quadratic Programming
### Aliases: qprog
### Keywords: cone projection routines

### ** Examples

# load the cubic data set
    data(cubic)

# extract x
    x <- cubic$x

# extract y
    y <- cubic$y

# make the design matrix
    xmat <- cbind(1, x, x^2, x^3)

# make the q matrix
    q <- crossprod(xmat)

# make the c vector
    c <- crossprod(xmat, y)

# make the constraint matrix to constrain the regression to be increasing, nonnegative and convex
    amat <- matrix(0, 4, 4)
    amat[1, 1] <- 1; amat[2, 2] <- 1
    amat[3, 3] <- 1; amat[4, 3] <- 1
    amat[4, 4] <- 6
    b <- rep(0, 4)

# call qprog 
    ans <- qprog(q, c, amat, b)

# get the constrained fit of y
    betahat <- fitted(ans)
    fitc <- crossprod(t(xmat), betahat)

# get the unconstrained fit of y
    fitu <- lm(y ~ x + I(x^2) + I(x^3))

# make a plot to compare fitc and fitu
    par(mar = c(4, 4, 1, 1))
    plot(x, y, cex = .7, xlab = "x", ylab = "y")
    lines(x, fitted(fitu))
    lines(x, fitc, col = 2, lty = 4)
    legend("topleft", bty = "n", c("constr.fit", "unconstr.fit"), lty = c(4, 1), col = c(2, 1))
    title("Qprog Example Plot")



