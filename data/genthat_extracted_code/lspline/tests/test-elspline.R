context("Testing elspline")

# Data
d <- data.frame(
  x = 0:10,
  y = c(6:1, 2:6)
)


test_that("elspline() works for integer input", {
  expect_silent(
    m1 <- lm(y ~ elspline(x, 2, marginal=FALSE), data=d)
  )
  expect_equivalent( coef(m1), c(6, -1, 1) )
})



test_that("qlspline() computes correct knot location", {
  # Knot is at median of `x`
  expect_equivalent(
    attr(lm(y ~ elspline(x, 2, marginal=FALSE), data=d)$model$`elspline(x, 2, marginal = FALSE)`, "knots"),
    5  )
  # Knot is at quartiles
  expect_equivalent(
    attr(lm(y ~ elspline(x, 4, marginal=FALSE), data=d)$model$`elspline(x, 4, marginal = FALSE)`, "knots"),
    c(2.5, 5, 7.5)
  )
})
