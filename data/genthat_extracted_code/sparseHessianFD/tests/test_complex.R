## Part of the sparseHessianFD package
## Copyright (C) 2013-2017 Michael Braun

context("complex step")

test_that("binary_example_complex", {

    set.seed(1234)
    data(binary)
    binary <- binary

    N <- length(binary$Y)
    k <- NROW(binary$X)
    nvars <- as.integer(N*k + k)
    P <- rnorm(nvars) ## random starting values

    Omega <- diag(k)
    priors <- list(inv.Omega = solve(Omega),
                   inv.Sigma = rWishart(1,k+5,diag(k))[,,1])

    make.funcs <- function(D, priors, order.row) {
        res <- vector("list", length=3)
        names(res) <- c("fn", "gr", "hessian")
        res$fn <-  function(pars) {
            binary.f(pars, data=D, priors=priors, order.row=order.row)
        }
        res$gr <-  function(pars) {
            binary.grad(pars, data=D, priors=priors, order.row=order.row)
        }
        res$hessian <-  function(pars) {
            binary.hess(pars, data=D, priors=priors, order.row=order.row)
        }
        return(res)
    }

    f1 <- make.funcs(D=binary, priors=priors, order.row=FALSE) ## block-arrow
    f2 <- make.funcs(D=binary, priors=priors, order.row=TRUE) ## off-diagonals

    ## True values for test

    true.val1 <- f1$fn(P)
    true.grad1 <- f1$gr(P)
    true.hess1 <- drop0(f1$hessian(P))

    true.val2 <- f2$fn(P)
    true.grad2 <- f2$gr(P)
    true.hess2 <- drop0(f2$hessian(P))

    ## Get hessian structure
    pat1 <- Matrix.to.Coord(tril(true.hess1))
    pat2 <- Matrix.to.Coord(tril(true.hess2))

    obj1 <- sparseHessianFD(P, f1$fn, f1$gr, pat1$rows, pat1$cols, complex=TRUE)
    obj2 <- sparseHessianFD(P, f2$fn, f2$gr, pat2$rows, pat2$cols, complex=TRUE)
  

    test.val1 <- obj1$fn(P)
    test.grad1 <- obj1$gr(P)
    test.hess1 <- obj1$hessian(P)

    test.val2 <- obj2$fn(P)
    test.grad2 <- obj2$gr(P)
    test.hess2 <- obj2$hessian(P)


    expect_equal(test.val1, true.val1)
    expect_equal(test.grad1, true.grad1)
    expect_equal(test.hess1, true.hess1)
    expect_equal(test.val2, true.val2)
    expect_equal(test.grad2, true.grad2)
    expect_equal(test.hess2, true.hess2)
 
})





