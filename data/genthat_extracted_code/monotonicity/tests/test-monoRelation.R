context('functions')

test_that('monoRelation', {
  tmp <- monoRelation(demo_returns, block_length = 10)

  # test for dimension of output
  expect_equal(dim(tmp),as.integer(c(4,2)))

  # test that all probability values are within the range [0,1]
  expect_gte(tmp[1,1], expected = 0)
  expect_gte(tmp[2,1], expected = 0)
  expect_gte(tmp[3,1], expected = 0)
  expect_gte(tmp[4,1], expected = 0)
  expect_gte(tmp[1,2], expected = 0)
  expect_gte(tmp[2,2], expected = 0)
  expect_gte(tmp[3,2], expected = 0)
  expect_gte(tmp[4,2], expected = 0)

  expect_lte(tmp[1,1], expected = 1)
  expect_lte(tmp[2,1], expected = 1)
  expect_lte(tmp[3,1], expected = 1)
  expect_lte(tmp[4,1], expected = 1)
  expect_lte(tmp[1,2], expected = 1)
  expect_lte(tmp[2,2], expected = 1)
  expect_lte(tmp[3,2], expected = 1)
  expect_lte(tmp[4,2], expected = 1)
})
