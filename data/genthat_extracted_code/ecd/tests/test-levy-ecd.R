
context("Test on Levy sub-project")

eps <- 0.001 # default tolerance of error for real number
eps5 <- 0.00001 # high prec

p4 <- function(x) levy.dlambda(x)
levy <- function(x) levy.dskewed(x)
levy_x <- c(0.5, 0.05, 0.025)
levy_y <- c(0.4839414, 0.1700073, 0.00323996)

# -----------------------------------------------
test_that("test unity of dlambda (lambda=4)",{
    N <- 20000
    u <- seq(-200, 200, length.out=N+1)
    y <- sum(p4(u))*(u[2]-u[1]) # must be one!
    expect_true(abs(y-1) < eps)
})
test_that("test known values of skewed Levy (lambda=4)",{
    y <- levy(levy_x)
    err <- y/levy_y-1
    expect_true(max(abs(err)) < eps)
})

