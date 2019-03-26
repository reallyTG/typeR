## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(
    message = FALSE,
    warning = FALSE,
    error = FALSE,
    tidy = FALSE,
    cache = FALSE
)

## ------------------------------------------------------------------------
loadedSuggested  <- c(benchr = FALSE, R2Cuba = FALSE)
if (requireNamespace("benchr", quietly = TRUE)) {
    loadedSuggested["benchr"] <- TRUE
}
if (requireNamespace("R2Cuba", quietly = TRUE)) {
    loadedSuggested["R2Cuba"] <- TRUE
}

library(cubature)

harness <- function(which = NULL,
                    f, fv, lowerLimit, upperLimit, tol = 1e-3, times = 20, ...) {

    fns <- c(hc = "Non-vectorized Hcubature",
             hc.v = "Vectorized Hcubature",
             pc = "Non-vectorized Pcubature",
             pc.v = "Vectorized Pcubature")

    if (loadedSuggested["R2Cuba"]) {
        fns <- c(fns, cc = "R2Cuba::cuhre")
        cc <- function() R2Cuba::cuhre(ndim = ndim, ncomp = 1, integrand = f,
                                       lower = lowerLimit, upper = upperLimit,
                                       flags = list(verbose = 0, final = 1),
                                       rel.tol = tol,
                                       max.eval = 10^6,
                                       ...)
    }

    hc <- function() cubature::hcubature(f = f,
                                         lowerLimit = lowerLimit,
                                         upperLimit = upperLimit,
                                         tol = tol,
                                         ...)

    hc.v <- function() cubature::hcubature(f = fv,
                                           lowerLimit = lowerLimit,
                                           upperLimit = upperLimit,
                                           tol = tol,
                                           vectorInterface = TRUE,
                                           ...)

    pc <- function() cubature::pcubature(f = f,
                                         lowerLimit = lowerLimit,
                                         upperLimit = upperLimit,
                                         tol = tol,
                                         ...)

    pc.v <- function() cubature::pcubature(f = fv,
                                           lowerLimit = lowerLimit,
                                           upperLimit = upperLimit,
                                           tol = tol,
                                           vectorInterface = TRUE,
                                           ...)

    ndim = length(lowerLimit)

    if (is.null(which)) {
        fnIndices <- seq_along(fns)
    } else {
        fnIndices <- na.omit(match(which, names(fns)))
    }
    fnList <- lapply(names(fns)[fnIndices], function(x) call(x))

    if (loadedSuggested["benchr"]) {
        argList <- c(fnList, times = times, progress = FALSE)
        result <- do.call(benchr::benchmark, args = argList)
        d <- summary(result)[seq_along(fnIndices), ]
        d$expr <- fns[fnIndices]
        d
    } else {
        d <- data.frame(expr = names(fns)[fnIndices], timing = NA)
    }
}

## ------------------------------------------------------------------------
func <- function(x) sin(x[1]) * cos(x[2]) * exp(x[3])
func.v <- function(x) {
    matrix(apply(x, 2, function(z) sin(z[1]) * cos(z[2]) * exp(z[3])), ncol = ncol(x))
}

d <- harness(f = func, fv = func.v,
             lowerLimit = rep(0, 3),
             upperLimit = rep(1, 3),
             tol = 1e-5,
             times = 100)
knitr::kable(d, digits = 3, row.names = FALSE)

## ------------------------------------------------------------------------
m <- 3
sigma <- diag(3)
sigma[2,1] <- sigma[1, 2] <- 3/5 ; sigma[3,1] <- sigma[1, 3] <- 1/3
sigma[3,2] <- sigma[2, 3] <- 11/15
logdet <- sum(log(eigen(sigma, symmetric = TRUE, only.values = TRUE)$values))
my_dmvnorm <- function (x, mean, sigma, logdet) {
    x <- matrix(x, ncol = length(x))
    distval <- stats::mahalanobis(x, center = mean, cov = sigma)
    exp(-(3 * log(2 * pi) + logdet + distval)/2)
}

my_dmvnorm_v <- function (x, mean, sigma, logdet) {
    distval <- stats::mahalanobis(t(x), center = mean, cov = sigma)
    exp(matrix(-(3 * log(2 * pi) + logdet + distval)/2, ncol = ncol(x)))
}

## ------------------------------------------------------------------------
d <- harness(f = my_dmvnorm, fv = my_dmvnorm_v,
             lowerLimit = rep(-0.5, 3),
             upperLimit = c(1, 4, 2),
             tol = 1e-5,
             times = 10,
             mean = rep(0, m), sigma = sigma, logdet = logdet)
knitr::kable(d, digits = 3)

## ------------------------------------------------------------------------
library(mvtnorm)
g1 <- function() mvtnorm::pmvnorm(lower = rep(-0.5, m),
                                  upper = c(1, 4, 2), mean = rep(0, m), corr = sigma,
                                  alg = Miwa(), abseps = 1e-5, releps = 1e-5)
g2 <- function() mvtnorm::pmvnorm(lower = rep(-0.5, m),
                                  upper = c(1, 4, 2), mean = rep(0, m), corr = sigma,
                                  alg = GenzBretz(), abseps = 1e-5, releps = 1e-5)
g3 <- function() mvtnorm::pmvnorm(lower = rep(-0.5, m),
                                  upper = c(1, 4, 2), mean = rep(0, m), corr = sigma,
                                  alg = TVPACK(), abseps = 1e-5, releps = 1e-5)

knitr::kable(summary(benchr::benchmark(g1(), g2(), g3(), times = 20, progress = FALSE)),
             digits = 3, row.names = FALSE)

## ------------------------------------------------------------------------
testFn0 <- function(x) prod(cos(x))
testFn0_v <- function(x) matrix(apply(x, 2, function(z) prod(cos(z))), ncol = ncol(x))

d <- harness(f = testFn0, fv = testFn0_v,
             lowerLimit = rep(0, 2), upperLimit = rep(1, 2), times = 1000)
knitr::kable(d, digits = 3)

## ------------------------------------------------------------------------
testFn1 <- function(x) {
    val <- sum(((1 - x) / x)^2)
    scale <- prod((2 / sqrt(pi)) / x^2)
    exp(-val) * scale
}

testFn1_v <- function(x) {
    val <- matrix(apply(x, 2, function(z) sum(((1 - z) / z)^2)), ncol(x))
    scale <- matrix(apply(x, 2, function(z) prod((2 / sqrt(pi)) / z^2)), ncol(x))
    exp(-val) * scale
}

d <- harness(f = testFn1, fv = testFn1_v,
             lowerLimit = rep(0, 3), upperLimit = rep(1, 3), times = 10)

knitr::kable(d, digits = 3)

## ------------------------------------------------------------------------
testFn2 <- function(x) {
    radius <- 0.50124145262344534123412
    ifelse(sum(x * x) < radius * radius, 1, 0)
}

testFn2_v <- function(x) {
    radius <- 0.50124145262344534123412
    matrix(apply(x, 2, function(z) ifelse(sum(z * z) < radius * radius, 1, 0)), ncol = ncol(x))
}

d <- harness(which = c("hc", "hc.v", "cc"),
             f = testFn2, fv = testFn2_v,
             lowerLimit = rep(0, 2), upperLimit = rep(1, 2), times = 10)
knitr::kable(d, digits = 3)

## ------------------------------------------------------------------------
testFn3 <- function(x) prod(2 * x)
testFn3_v <- function(x) matrix(apply(x, 2, function(z) prod(2 * z)), ncol = ncol(x))

d <- harness(f = testFn3, fv = testFn3_v,
             lowerLimit = rep(0, 3), upperLimit = rep(1, 3), times = 50)
knitr::kable(d, digits = 3)

## ------------------------------------------------------------------------
testFn4 <- function(x) {
    a <- 0.1
    s <- sum((x - 0.5)^2)
    ((2 / sqrt(pi)) / (2. * a))^length(x) * exp (-s / (a * a))
}

testFn4_v <- function(x) {
    a <- 0.1
    r <- apply(x, 2, function(z) {
        s <- sum((z - 0.5)^2)
        ((2 / sqrt(pi)) / (2. * a))^length(z) * exp (-s / (a * a))
    })
    matrix(r, ncol = ncol(x))
}

d <- harness(f = testFn4, fv = testFn4_v,
             lowerLimit = rep(0, 2), upperLimit = rep(1, 2), times = 20)
knitr::kable(d, digits = 3)

## ------------------------------------------------------------------------
testFn5 <- function(x) {
    a <- 0.1
    s1 <- sum((x - 1 / 3)^2)
    s2 <- sum((x - 2 / 3)^2)
    0.5 * ((2 / sqrt(pi)) / (2. * a))^length(x) * (exp(-s1 / (a * a)) + exp(-s2 / (a * a)))
}
testFn5_v <- function(x) {
    a <- 0.1
    r <- apply(x, 2, function(z) {
        s1 <- sum((z - 1 / 3)^2)
        s2 <- sum((z - 2 / 3)^2)
        0.5 * ((2 / sqrt(pi)) / (2. * a))^length(z) * (exp(-s1 / (a * a)) + exp(-s2 / (a * a)))
    })
    matrix(r, ncol = ncol(x))
}

d <- harness(f = testFn5, fv = testFn5_v,
             lowerLimit = rep(0, 2), upperLimit = rep(1, 2), times = 20)
knitr::kable(d, digits = 3)

## ------------------------------------------------------------------------
testFn6 <- function(x) {
    a <- (1 + sqrt(10.0)) / 9.0
    prod( a / (a + 1) * ((a + 1) / (a + x))^2)
}

testFn6_v <- function(x) {
    a <- (1 + sqrt(10.0)) / 9.0
    r <- apply(x, 2, function(z) prod( a / (a + 1) * ((a + 1) / (a + z))^2))
    matrix(r, ncol = ncol(x))
}

d <- harness(f = testFn6, fv = testFn6_v,
             lowerLimit = rep(0, 3), upperLimit = rep(1, 3), times = 20)
knitr::kable(d, digits = 3)

## ------------------------------------------------------------------------
testFn7 <- function(x) {
    n <- length(x)
    p <- 1/n
    (1 + p)^n * prod(x^p)
}
testFn7_v <- function(x) {
    matrix(apply(x, 2, function(z) {
        n <- length(z)
        p <- 1/n
        (1 + p)^n * prod(z^p)
    }), ncol = ncol(x))
}

d <- harness(f = testFn7, fv = testFn7_v,
             lowerLimit = rep(0, 3), upperLimit = rep(1, 3), times = 20)
knitr::kable(d, digits = 3)

## ------------------------------------------------------------------------
I.1d <- function(x) {
    sin(4 * x) *
        x * ((x * ( x * (x * x - 4) + 1) - 1))
}
I.1d_v <- function(x) {
    matrix(apply(x, 2, function(z)
        sin(4 * z) *
        z * ((z * ( z * (z * z - 4) + 1) - 1))),
        ncol = ncol(x))
}
d <- harness(f = I.1d, fv = I.1d_v,
             lowerLimit = -2, upperLimit = 2, times = 100)
knitr::kable(d, digits = 3)

## ------------------------------------------------------------------------
I.2d <- function(x) {
    x1 <- x[1]; x2 <- x[2]
    sin(4 * x1 + 1) * cos(4 * x2) * x1 * (x1 * (x1 * x1)^2 - x2 * (x2 * x2 - x1) +2)
}
I.2d_v <- function(x) {
    matrix(apply(x, 2,
                 function(z) {
                     x1 <- z[1]; x2 <- z[2]
                     sin(4 * x1 + 1) * cos(4 * x2) * x1 * (x1 * (x1 * x1)^2 - x2 * (x2 * x2 - x1) +2)
                 }),
           ncol = ncol(x))
}
d <- harness(f = I.2d, fv = I.2d_v,
             lowerLimit = rep(-1, 2), upperLimit = rep(1, 2), times = 100)
knitr::kable(d, digits = 3)

## ------------------------------------------------------------------------
sessionInfo()

