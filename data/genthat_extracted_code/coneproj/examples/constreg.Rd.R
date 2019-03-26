library(coneproj)


### Name: constreg
### Title: Constrained Parametric Regression
### Aliases: constreg
### Keywords: cone projection routines

### ** Examples

# load the FEV data set
    data(FEV)

# extract the variables
    y <- FEV$FEV
    age <- FEV$age
    height <- FEV$height
    sex <- FEV$sex
    smoke <- FEV$smoke

# scale age and height
    scale_age <- (age - min(age)) / (max(age) - min(age))
    scale_height <- (height - min(height)) / (max(height) - min(height))

# make xmat
    xmat <- cbind(1, scale_age, scale_height, scale_age * scale_height, sex, smoke)

# make the constraint matrix 
    amat <- matrix(0, 4, 6)
    amat[1, 2] <- 1; amat[2, 2] <- 1; amat[2, 4] <- 1 
    amat[3, 3] <- 1; amat[4, 3] <- 1; amat[4, 4] <- 1

# call constreg to get constrained coefficient estimates
    ans1 <- constreg(y, xmat, amat)
    bhat1 <- coef(ans1)

# call lm to get unconstrained coefficient estimates
    ans2 <- lm(y ~ xmat[,-1])
    bhat2 <- coef(ans2)

# create a 3D plot to show the constrained fit and the unconstrained fit 
    n <- 25
    xgrid <- seq(0, 1, by = 1/n)
    ygrid <- seq(0, 1, by = 1/n)
    x1 <- rep(xgrid, each = length(ygrid))
    x2 <- rep(ygrid, length(xgrid))
    xinterp <- cbind(x1, x2)
    xmatp <- cbind(1, xinterp, x1 * x2, 0, 0)
    
    thint1 <- crossprod(t(xmatp), bhat1)
    A1 <- matrix(thint1, length(xgrid), length(ygrid), byrow = TRUE) 
    thint2 <- crossprod(t(xmatp), bhat2)
    A2 <- matrix(thint2, length(xgrid), length(ygrid), byrow = TRUE) 

    par(mfrow = c(1, 2))
    par(mar = c(4, 1, 1, 1))
    persp(xgrid, ygrid, A1, xlab = "age", ylab = "height", 
    zlab = "FEV", theta = -30)
    title("Constrained Fit")

    par(mar = c(4, 1, 1, 1))
    persp(xgrid, ygrid, A2, xlab = "age", ylab = "height", 
    zlab = "FEV", theta = -30)
    title("Unconstrained Fit")



