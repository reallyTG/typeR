test_that("Environment nesting", {
  Mcheck <- matrix(c(1, -0.2,
                     0.2,  1),
                   nrow = 2,
                   byrow = TRUE)

  # assign to list
  lsc <- ls1 <- list()
  lsc$M <- Mcheck
  ls1$M %<-% "  1, -0.2
              0.2,    1"
  expect_equal(ls1, lsc)

  # assign within environment
  nec <- new.env()
  ne1 <- new.env()
  nec$M <- Mcheck
  ne1$M %<-% "  1, -0.2
              0.2,    1"
  expect_equal(ne1, nec)

  # evaluate within function
  fc <- function(value) {
    val <- value
    return(val^2)
  }

  f1 <- function(value) {
    val %<-% value
    return(val^2)
  }

  expect_equal(f1("  1, -0.2
                   0.2,    1"),
               fc(Mcheck))

  # crazy stuff
  ne2 <- new.env()
  ne2$M1 %<-% "  1, -0.2
               0.2,    1"
  ne2$l <- list()
  ne2$l$M2 %<-% "1, -0.2 \\ 0.2, 1"

  expect_warning(res1 <- with(ne2, M1 %*>% l$M2))
  expect_equal(res1, Mcheck%*%Mcheck)
})
