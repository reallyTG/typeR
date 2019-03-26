df <- data.frame(data = c(1,7,1,2,3,3,5.5,6,7), group = c(1,1,1,2,2,3,3,3,3))
df$group <- as.factor(df$group)

result_max <- c(2.00, 9.00, 2.00, 3.50, 5.75, 5.75, 6.50, 7.25, 9.00)
result_min <- c(1.00, 8.25, 1.00, 3.00, 4.50, 4.50, 6.75, 7.50, 8.25)

m <- pseudorank::pseudorank(df$data, df$group, ties.method = "min")
M <- pseudorank::pseudorank(df$data, df$group, ties.method = "max")
mid <- pseudorank::pseudorank(df$data, df$group, ties.method = "average")

context("Max and Min Pseudo-Ranks")

test_that("function pseudorank ties.method", {
  expect_equivalent(pseudorank::pseudorank(df$data, df$group, ties.method = "max"), result_max)
  expect_equivalent(pseudorank::pseudorank(df$data, df$group, ties.method = "min"), result_min)
  expect_equivalent(0.5*(m+M), mid)
})


df <- data.frame(data = c(1,7,1,2,3,3,5.5,5.5,7), group = c(1,1,1,2,2,3,3,3,3))
df$group <- as.factor(df$group)
m <- pseudorank::pseudorank(df$data, df$group, ties.method = "min")
M <- pseudorank::pseudorank(df$data, df$group, ties.method = "max")
mid <- pseudorank::pseudorank(df$data, df$group, ties.method = "average")

test_that("function pseudorank ties.method", {
  expect_equivalent(0.5*(m+M), mid)
})


df <- data.frame(data = c(1,7,1,2,3,3,5.5,7,7), group = c(1,1,1,2,2,2,3,3,3))
df$group <- as.factor(df$group)
m <- pseudorank::pseudorank(df$data, df$group, ties.method = "min")
M <- pseudorank::pseudorank(df$data, df$group, ties.method = "max")
mid <- pseudorank::pseudorank(df$data, df$group, ties.method = "average")

test_that("function pseudorank rank ties.method", {
  expect_equivalent(0.5*(m+M), mid)
  expect_equivalent(m, rank(df$data, ties.method = "min"))
  expect_equivalent(M, rank(df$data, ties.method = "max"))
})
