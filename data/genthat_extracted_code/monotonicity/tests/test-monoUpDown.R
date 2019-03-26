context('functions')

test_that('monoUpDown', {
  # test for dimension of output
  expect_equal(dim(monoUpDown(demo_returns,block_length = 10)),as.integer(c(4,2)))

  # test that all probability values are within the range [0,1]
  expect_gte(monoUpDown(demo_returns,block_length = 10)[1,1],expected = 0)
  expect_gte(monoUpDown(demo_returns,block_length = 10)[2,1],expected = 0)
  expect_gte(monoUpDown(demo_returns,block_length = 10)[3,1],expected = 0)
  expect_gte(monoUpDown(demo_returns,block_length = 10)[4,1],expected = 0)
  expect_gte(monoUpDown(demo_returns,block_length = 10)[1,2],expected = 0)
  expect_gte(monoUpDown(demo_returns,block_length = 10)[2,2],expected = 0)
  expect_gte(monoUpDown(demo_returns,block_length = 10)[3,2],expected = 0)
  expect_gte(monoUpDown(demo_returns,block_length = 10)[4,2],expected = 0)

  expect_lte(monoUpDown(demo_returns,block_length = 10)[1,1],expected = 1)
  expect_lte(monoUpDown(demo_returns,block_length = 10)[2,1],expected = 1)
  expect_lte(monoUpDown(demo_returns,block_length = 10)[3,1],expected = 1)
  expect_lte(monoUpDown(demo_returns,block_length = 10)[4,1],expected = 1)
  expect_lte(monoUpDown(demo_returns,block_length = 10)[1,2],expected = 1)
  expect_lte(monoUpDown(demo_returns,block_length = 10)[2,2],expected = 1)
  expect_lte(monoUpDown(demo_returns,block_length = 10)[3,2],expected = 1)
  expect_lte(monoUpDown(demo_returns,block_length = 10)[4,2],expected = 1)
})
