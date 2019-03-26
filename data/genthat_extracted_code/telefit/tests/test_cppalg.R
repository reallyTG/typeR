context("Custom C++ linear algebra routines")

test_that("Kronecker products (I x A)B with I=diag(N)", {
  set.seed(2018)
  
  dims = c(N=3, m=4, n=5, p=2)

  A = matrix(rnorm(dims['m'] * dims['n']), ncol=dims['n'])
  B = matrix(rnorm( dims['N'] * dims['n'] * dims['p']), ncol=dims['p'])
      
  expect_equal(
    kronecker(diag(dims['N']), A) %*% B,
    .Call(`_telefit_r_dgeikmm`, dims['N'], A, B),
    tolerance = 1e-3
  )
})
