test_that("gammaln() matchest log(gamma())", {
  for (i in 1:100){
    expect_equal(gammaln(i), log(gamma(i)))
  }
  for (i in 1:100){
    expect_true(gammaln(i*10) > 0)
  }
})
