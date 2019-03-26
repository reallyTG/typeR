context("magic_free")

test_that("magic_free", {
  magic_for()
  for(i in 1:3) {
    x <- i * 2
    put(x)
  }
  act <- magic_result()
  expect_equal(act, list(x=list(2,4,6)))
  magic_free()
  act <- magic_result()
  expect_null(act)
})
