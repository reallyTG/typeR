context('functions')

test_that('wolak', {
  skip_on_cran()
  tmp <- wolak(demo_returns)

  expect_equal(tmp$TestOnePvalueWolak, 0)
  expect_equal(tmp$TestTwoPvalueWolak, 0.9801157, tolerance=1e-7)

  # test that all probability values are within the range [0,1]
  expect_gte(tmp$TestOnePvalueWolak,expected = 0)
  expect_gte(tmp$TestTwoPvalueWolak,expected = 0)

  expect_lte(tmp$TestOnePvalueWolak,expected = 1)
  expect_lte(tmp$TestTwoPvalueWolak,expected = 1)
})
