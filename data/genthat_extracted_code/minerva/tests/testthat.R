context("Check MINE scores consistency")

## Create constant vector
const.create <- function(n){
    x <- seq(0, 1, length.out=n)
    y <- rep(0, n)
    retval <- data.frame(X=x, Y=y)
    return(retval)
}

## Create two linear vector
lin.create <- function(n){
    x <- seq(0, 1, length.out=n)
    retval <- data.frame(X=x, Y=x)
    return(retval)
}


## Create  SIN
sin.create <- function(n){
    x <- seq(0, 1, length.out=n)
    y <- sin(8 * pi * x)
    retval <- data.frame(X=x, Y=y)
    return(retval)
}

## Create exp
exp.create <- function(n){
    x <- seq(0, 1, length.out=n)
    y <- 2**x
    retval <- data.frame(X=x, Y=y)
    return(retval)
}

test_that("Test constant:", {
    mydata <- const.create(1000)
    mm <- mine(mydata$X, mydata$Y)
    expect_equal(mm$MIC, 0, tolerance=1e-4)
    expect_equal(mm$MAS, 0, tolerance=1e-4)
    expect_equal(mm$MEV, 0, tolerance=1e-4)
    expect_equal(mm$MCN, 2, tolerance=1e-4)
}
)

test_that("Test linear:", {
    mydata <- lin.create(1000)
    mm <- mine(mydata$X, mydata$Y)
    expect_equal(mm$MIC, 1, tolerance=1e-4)
    expect_equal(mm$MAS, 0, tolerance=1e-4)
    expect_equal(mm$MEV, 1, tolerance=1e-4)
    expect_equal(mm$MCN, 2, tolerance=1e-4)
}
)

test_that("Test sin:", {
    mydata <- sin.create(1000)
    mm <- mine(mydata$X, mydata$Y)
    expect_equal(mm$MIC, 1, tolerance=1e-4)
    expect_equal(mm$MAS, 0.875, tolerance=1e-4)
    expect_equal(mm$MEV, 1, tolerance=1e-4)
    expect_equal(mm$MCN, 4, tolerance=1e-4)
}
)

test_that("Test exp:", {
    mydata <- exp.create(1000)
    mm <- mine(mydata$X, mydata$Y)
    expect_equal(mm$MIC, 1, tolerance=1e-4)
    expect_equal(mm$MAS, 0, tolerance=1e-4)
    expect_equal(mm$MEV, 1, tolerance=1e-4)
    expect_equal(mm$MCN, 2, tolerance=1e-4)
}
)

## test_that("Test bug 1:", {
##     a <- mine(x = cbind(matrix(c(rnorm(6), 0, 0, 0), nrow = 3), rnorm(3)), master = 4)
##     b <- mine(x = matrix(c(rnorm(6), 0, 0, 0), nrow = 3), y = rnorm(3))
##     expect_equal(a$MIC, b$MIC, tolerance=1e-4)
## }
## )

test_that("Test rcpp interface:", {
    mydata <- lin.create(1000)
    mm <- mine(mydata$X, mydata$Y)
    mm2 <- mine_stat(mydata$X, mydata$Y)
    expect_equal(mm$MIC, mm2, tolerance=1e-6)
})

