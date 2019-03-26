xInc <- function(m, p) outer(1:p, 1:p, function(i, j) as.integer(i >= j))[1:m, , drop = FALSE]

I <- function(m) diag(m)
J <- function(m) matrix(1, nrow = m, ncol = m)
M <- function(m) outer(1:m, 1:m, pmin)
Z <- function(m) matrix(0, nrow = m, ncol = m)

V <- function(m) array(c(J(m), I(m) - J(m)), dim = c(m, m, 2))
W <- function(m) array(c(I(m) - (1 / m) * J(m), (1 / m^2) * J(m)), dim = c(m, m, 2)) 

test_that("test of compute_laurent", {
	expect_equal(compute_laurent(V(2)), W(2), tolerance = 1e-7)
	expect_equal(compute_laurent(V(3)), W(3), tolerance = 1e-7)
	expect_equal(compute_laurent(V(5)), W(5), tolerance = 1e-7)
})

xlist <- list(xInc(1, 3), xInc(2, 3), xInc(3, 3))
Vlist <- list(V(1), V(2), V(3))
ylist <- list(1, c(2, 4), c(3, 5, 7))

test_that("test of fit_slim", {
	expect_equal(fit_slim(xlist, Vlist, ylist)$coefficients, c(2, 2, 2),
		tolerance = 1e-7)
})
