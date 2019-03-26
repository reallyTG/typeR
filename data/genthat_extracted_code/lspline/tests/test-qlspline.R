context("Testing qlspline")

# Data
d <- data.frame(
  x = 0:10,
  y = c(6:1, 2:6)
)


test_that("qlspline() works for integer input", {
  expect_silent(
    m1 <- lm(y ~ qlspline(x, 2, marginal=FALSE), data=d)
  )
  expect_equivalent( coef(m1), c(6, -1, 1) )
  # Knot is at median of `x`
  expect_equivalent( attr(m1$model$`qlspline(x, 2, marginal = FALSE)`, "knots"), median(d$x) )
})



test_that("qlspline() computes correct knot location", {
  # Knot is at median of `x`
  expect_equivalent(
    attr(lm(y ~ qlspline(x, 2, marginal=FALSE), data=d)$model$`qlspline(x, 2, marginal = FALSE)`, "knots"),
    median(d$x)
  )
  # Knot is at quartiles
  expect_equivalent(
    attr(lm(y ~ qlspline(x, 4, marginal=FALSE), data=d)$model$`qlspline(x, 4, marginal = FALSE)`, "knots"),
    quantile(d$x, probs=c(0.25, 0.5, 0.75))
  )
})
