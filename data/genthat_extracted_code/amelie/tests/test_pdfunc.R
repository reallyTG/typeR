context("pdfunc")

test_that("univ pdfunc result matches .univariate_pdf", {
  dmat <- matrix(c(3,1,3,1,2,3,-1,0),nrow=2)
  x_mean <- .mean2(dmat)
  x_var <- .var2(dmat)
  expect_equal(.univariate_pdf(dmat,x_mean,x_var),
               pdfunc(dmat))
})

test_that("multiv pdfunc result matches .multivariate_pdf", {
  dmat <- matrix(c(3,1,3,1,2,3,-1,0),nrow=4)
  x_mean <- .mean2(dmat)
  x_cov <- cov(dmat)
  expect_equal(.multivariate_pdf(dmat,x_mean,x_cov),
               pdfunc(dmat,FALSE))
})

test_that("pdfunc result is different for multv and univ", {
  dmat <- matrix(c(3,1,3,1,2,3,-1,0),nrow=4)
  expect_false(isTRUE(all.equal(pdfunc(dmat,TRUE),pdfunc(dmat,FALSE),tolerance=1.0e-20)))
})
