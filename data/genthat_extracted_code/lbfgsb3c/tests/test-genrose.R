genrose.f <- function(x, gs = NULL) {
    # objective function
    ## One generalization of the Rosenbrock banana valley
    #   function (n parameters)
    n <- length(x)
    if (is.null(gs)) {
        gs = 100
    }
    fval <- 1 + sum(gs * (x[1:(n - 1)]^2 - x[2:n])^2 + (x[2:n] -
        1)^2)
    return(fval)
}

genrose.g <- function(x, gs = NULL) {
    # vectorized gradient for genrose.f
    # Ravi Varadhan 2009-04-03
    n <- length(x)
    if (is.null(gs)) {
        gs = 100
    }
    gg <- as.vector(rep(0, n))
    tn <- 2:n
    tn1 <- tn - 1
    z1 <- x[tn] - x[tn1]^2
    z2 <- 1 - x[tn]
    gg[tn] <- 2 * (gs * z1 - z2)
    gg[tn1] <- gg[tn1] - 4 * gs * x[tn1] * z1
    gg
}

context("Unconstrained Genrose test with gradient")

nn <- 100
xx <- rep(3, nn)
lo <- -Inf
up <- Inf
test_that("100u", {
    ans100u <- lbfgsb3c(xx, genrose.f,
                        genrose.g, gs = 10)
    expect_equal(1, ans100u$value)
})


context("Unconstrained Genrose test without gradient")
ans100un <- lbfgsb3c(xx, genrose.f,
                     gr = NULL, gs = 10)

test_that("100u", {
    ans100un <- lbfgsb3c(xx, genrose.f,
                        gs = 10)
    expect_equal(1, ans100un$value)
})
