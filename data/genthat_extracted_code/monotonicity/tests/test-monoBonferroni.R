context('functions')

test_that('monoBonferroni', {

  tmp <- monoBonferroni(demo_returns, difference = FALSE)

  expect_equal(tmp$TestOnePvalBonferroni, 1)
  expect_equal(tmp$TestTwoPvalBonferroni, 1)

})
