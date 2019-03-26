context("test check_input_vec")

y1 <- 1:10
y2 <- seq(1, 20, 1)
y3 <- as.factor(1:10)
y4 <- cbind(y1, y1)
y5 <- letters
y6 <- seq(0, 1, 0.1)
y7 <- c(1:8, 10)
y8 <- seq(2, 20, 2)
y8 <- y8[-4]


test_that("correct return", {
  expect_equal(typeof(y1), typeof(check_input_vec(y1,
    "y")))
  expect_equal(typeof(y2), typeof(check_input_vec(y2,
    "y")))
})

test_that("error messages", {
  expect_error(check_input_vec(y3, "y"), "not a factor!")  # partial matches
  expect_error(check_input_vec(y4, "y"), "has to be a VECTOR!")
  expect_error(check_input_vec(y5, "y"), "has to be an INTEGER vector!")
  expect_error(check_input_vec(y6, "time"), "has to be an INTEGER vector!")
  expect_error(check_input_vec(y7, "time"))
  expect_error(check_input_vec(y8, "time"))
})
