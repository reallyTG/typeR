context("ECOS suite Tests")
## test 1a_bool
## test_that("test1a returns the right answer", {
##     G <- local({
##         Gpr <- c(2.0, 3.0, 1.0, 4.0)
##         Gjc <- as.integer(c(0, 2, 4))
##         Gir <- as.integer(c(0, 1, 0, 1))
##         sparseMatrix(x=Gpr, i=Gir, p=Gjc, index1=FALSE)
##     })
##     c <- c(-1.1, -1.)
##     h <- c(4., 12.)
##     dims <- list(l=2L, q=NULL, e=0L)
##     bool_idx <- 1L

##     retval <- ECOS_csolve(c = c, G = G, h = h,
##                            dims = dims,
##                            A = NULL, b = numeric(0),
##                            bool_vars = bool_idx)

##     ## Answer:
##     ## pfloat x[2] = {1.0, 2.0};
##     expect_equal(c(1.0, 2.0), retval$x)
## })
