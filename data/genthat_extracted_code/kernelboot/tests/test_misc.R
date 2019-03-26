

test_that("misc tests", {

  obj <- kernelboot(mtcars, function(data) coef(lm(mpg ~ ., data = data)), R = 10)

  expect_output(print(obj))
  expect_silent(summary(obj))

  expect_true(kernelboot:::is.diag(diag(10)))
  expect_false(kernelboot:::is.diag(matrix(1:9, 3)))

})
