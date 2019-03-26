context("Sanity checks")

test_that("required arguments are provided", {
  expect_error(
    Apply(),
    "missing, with no default"
  )
  expect_error(
    Apply(1:10),
    "missing, with no default"
  )
  expect_error(
    Apply(1:10, fun = mean),
    "must be specified"
  )
})

test_that("arguments have the right type", {
  expect_equal(
    Apply(1:10, NULL, mean),
    list(output1 = array(1:10, dim = 10))
  )
  expect_error(
    Apply(numeric(0), NULL, mean),
    "must be of length > 0"
  )
  #expect_error(
  #)
})


#context("Parameter order")
#
#test_that("", {
#  expect_that(
#    Apply(),
#    throws_error("")
#  )
#})
