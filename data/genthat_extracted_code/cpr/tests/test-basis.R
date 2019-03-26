require(splines)

test_that("Equivalent Basis Matrix", 
          { 
            expect_equivalent(unclass(cpr::bsplines(0:10, iknots = c(2, 2.6, 7.8), bknots = c(0, 10), order = 4)),
                              unclass(splines::bs(0:10, knots = c(2, 2.6, 7.8), Boundary.knots = c(0, 10), intercept = TRUE)))
          }
)

test_that("Knots will be sorted", 
          {
            xvec <- seq(-1, 1, length = 25)
            iknots <- c(0.34, -0.23)

            expect_warning(cpr::bsplines(xvec, iknots = iknots), "Sorting knots")

            expect_equivalent(unclass(suppressWarnings(cpr::bsplines(xvec, iknots = c(.34, -.23)))),
                              unclass(splines::bs(xvec, knots = iknots, intercept = TRUE))) 
          })

test_that("x is not a list", 
          {
            expect_error(cpr::bsplines(list(1:10)), "btensor")
          })

test_that("combinations of iknots and df are handled well",
          {
            xvec <- seq(-1, 1, length = 25)
            expect_warning(cpr::bsplines(xvec, df = 2), "df being set to order")
            expect_equivalent(suppressWarnings(cpr::bsplines(xvec, df = 2)), cpr::bsplines(xvec, df = 4))
            expect_equivalent(suppressWarnings(cpr::bsplines(xvec, df = 4, order = 5)), cpr::bsplines(xvec, df = 5, order = 5))
            expect_equivalent(suppressWarnings(cpr::bsplines(xvec, df = 4, order = 5)), cpr::bsplines(xvec, order = 5))

            expect_warning(cpr::bsplines(xvec, iknots = 0.2, df = 6), "using iknots")
            expect_equivalent(suppressWarnings(cpr::bsplines(xvec, iknots = 0.2, df = 6)),
                              cpr::bsplines(xvec, iknots = 0.2)) 

            expect_equivalent(cpr::bsplines(xvec, df = 7), 
                              cpr::bsplines(xvec, iknots = trimmed_quantile(xvec, probs = 1:3/4)))
          })

test_that("derivatives are as expected.",
          {
            xvec <- seq(-1, 5, length = 100)
            iknots <- c(-0.8, 0.2, 2.3, 2.5)

            xi <- sort(c(rep(range(xvec), 4), iknots))

            baseD1 <- spline.des(xi, xvec, derivs = rep(1, length(xvec)))$design
            baseD2 <- spline.des(xi, xvec, derivs = rep(2, length(xvec)))$design

            cprD1 <- bsplineD(xvec, iknots = iknots)
            cprD2 <- bsplineD(xvec, iknots = iknots, derivative = 2L)

            expect_equal(cprD1[-100, ], baseD1[-100, ])
            expect_equal(cprD2[-100, ], baseD2[-100, ])

            expect_error(bsplineD(xvec, derivative = 1.5))
            expect_error(bsplineD(xvec, derivative = 3))

          })
