context("Missing Values")

f <- data.frame(
  output = c("t", "f", "t", "t", "t", "f", "f", "t", "f", "t"),
  X1 = c(3, 10, NA, NA, 7, 15, 8, 10, NA, 9),
  X2 = c("a", "b", "c", "c", NA, "c", NA, "a", "b", "b"),
  x3 = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA)
)

t <- sboost(f[-1], f[1], 3, "t")

test_that("Algorithm is classifying with missing values properly.", {
  expect_equal(t$classifier$feature, c("X2", "X1", "X1"))
  expect_equal(round(t$classifier$vote, digits = 5), c(0.42365, 0.43919, 0.26623))
  expect_equal(t$classifier$left, c("t", "t", "t"))
  expect_equal(t$classifier$right, c("f", "f", "f"))
  expect_equal(t$classifier$split, c(NA, 9.5, 12.5))
  expect_equal(t$classifier$left_categories, c("a; c", NA, NA))
})

a <- assess(t, f[-1], f[1])
p <- predict(t, rbind(f[-1], c(NA, NA, NA)))
ps <- predict(t, rbind(f[-1], c(NA, NA, NA)), scores = TRUE)

test_that("Predicting with missing values are correct.", {
  expect_equal(a$cumulalative_statistics$accuracy, c(0.7, 0.8, 0.9))
  expect_equal(p, c("t", "f", "t", "t", "t", "f", "t", "t", "f", "t", "f"))
  expect_equal(round(ps, digits = 5), c(1.12906, -0.59661, 0.42365, 0.42365, 0.70541, -0.28176, 0.70541, 0.25069, -0.42365, 0.28176, 0))
})


