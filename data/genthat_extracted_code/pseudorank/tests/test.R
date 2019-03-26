# data
test_df <- data.frame(data = c(1,7,1,2,3,3,5.5,6,7), group = c(1,1,1,2,2,3,3,3,3))
test_df$group <- factor(test_df$group)

test_df2 <- data.frame(data = c(1,7,1,2,3,3,5.5,6,7), group = c(1,3,1,2,2,3,3,3,1))
test_df2$group <- factor(test_df2$group)

# test function pseudorank
context("Function for Calculating Pseudo-Ranks")
true_result <- c(1.500, 8.625, 1.500, 3.250, 5.125, 5.125, 6.625, 7.375, 8.625)

test_that("function pseudorank", {
  expect_identical(pseudorank::pseudorank(test_df$data, test_df$group), true_result)
  expect_identical(pseudorank::pseudorank(y = test_df$group, x = test_df$data), true_result)
  expect_identical(pseudorank::pseudorank(data ~ group, test_df), true_result)
  
  expect_identical(pseudorank::pseudorank(test_df2$data, test_df2$group), true_result)
  expect_identical(pseudorank::pseudorank(data ~ group, data=test_df2), true_result)
  expect_identical(pseudorank::pseudorank(data ~ group, test_df2), true_result)
})

test_df <- data.frame(data = c(1,7,1,2,3,3,5.5,6,7), group = c(1,1,1,2,2,2,3,3,3))
test_df$group <- factor(test_df$group)

test_that("function pseudorank equal group sizes", {
  expect_identical(pseudorank::pseudorank(test_df$data, test_df$group), rank(test_df$data, ties.method = "average"))
  expect_identical(pseudorank::pseudorank(data~group, test_df), rank(test_df$data, ties.method = "average"))
})

# test pseudorank with missing values

test_df <- data.frame(data = c(NA,7,1,NA,3,3,5.5,6,NA, 3, 1), group = c(1,1,1,2,2,2,3,3,3,1,2))
test_df$group <- factor(test_df$group)

result_NA <- c(8.055556, 1.388889, 3.611111, 3.611111, 5.611111, 6.944444, 3.611111, 1.388889)
result_TRUE <- c(8.902778,  7.986111,  1.416667,  9.819444,  3.708333,  3.708333,  5.694444,  6.916667, 10.888889,  3.708333,  1.416667)
result_FALSE <- c(3.097222, 11.041667,  4.472222,  2.180556,  6.763889,  6.763889,  8.750000,  9.972222,  1.111111,  6.763889,  4.472222)

test_that("function pseudorank missing values", {
  expect_equivalent(pseudorank::pseudorank(test_df$data, test_df$group, na.last = TRUE), result_TRUE, tolerance=1e-04)
  expect_equivalent(pseudorank::pseudorank(test_df$data, test_df$group, na.last = FALSE), result_FALSE, tolerance=1e-04)
  expect_equivalent(pseudorank::pseudorank(test_df$data, test_df$group, na.last = NA), result_NA, tolerance=1e-04)
})


df1 <- data.frame(data = c(1,2,2,3,NA), group = as.factor(c(1,1,2,2,3)))

test_that("function pseudorank missing values: level dropped", {
  expect_equivalent(pseudorank::pseudorank(df1$data, df1$group, na.last = NA), rank(df1$data, ties.method="average", na.last = NA), tolerance=1e-04)
})


# more unit tests for ties
x <- c(1,1,1,1,2,3,4,5,6)
x2 <- c(6,6,6,6,5,4,3,2,1)
x3 <- rep(1,9)
x4 <- c(1,2,2,2,2,2,2,2,3)
x5 <- c(1,1,2,2,2,3,3,3,3)
grp <- as.factor(c(1,1,2,2,2,3,3,3,3))

result <- c(3.000, 3.000, 3.000, 3.000, 6.000, 6.875, 7.625, 8.375, 9.125)
result2 <- c(7.000, 7.000, 7.000, 7.000, 4.000, 3.125, 2.375, 1.625, 0.875)
result3 <- rep(5, 9)
result4 <- c(1.250, 5.375, 5.375, 5.375, 5.375, 5.375, 5.375, 5.375, 9.125)
result5 <- c(2, 2, 5, 5, 5, 8, 8, 8, 8)

test_that("function pseudorank: ties over groups", {
  expect_equivalent(pseudorank::pseudorank(x,grp), result)
  expect_equivalent(pseudorank::pseudorank(x,grp),(pseudorank::pseudorank(x,grp, ties.method="min")+pseudorank::pseudorank(x,grp, ties.method = "max"))*1/2 )
  
  expect_equivalent(pseudorank::pseudorank(x2,grp), result2)
  expect_equivalent(pseudorank::pseudorank(x2,grp),(pseudorank::pseudorank(x2,grp, ties.method="min")+pseudorank::pseudorank(x2,grp, ties.method = "max"))*1/2 )
  
  expect_equivalent(pseudorank::pseudorank(x3,grp), result3)
  expect_equivalent(pseudorank::pseudorank(x3,grp),(pseudorank::pseudorank(x3,grp, ties.method="min")+pseudorank::pseudorank(x3,grp, ties.method = "max"))*1/2 )
  
  expect_equivalent(pseudorank::pseudorank(x4,grp), result4)
  expect_equivalent(pseudorank::pseudorank(x4,grp),(pseudorank::pseudorank(x4,grp, ties.method="min")+pseudorank::pseudorank(x4,grp, ties.method = "max"))*1/2 )
  
  expect_equivalent(pseudorank::pseudorank(x5,grp), result5)
  expect_equivalent(pseudorank::pseudorank(x5,grp),(pseudorank::pseudorank(x5,grp, ties.method="min")+pseudorank::pseudorank(x5,grp, ties.method = "max"))*1/2 )
  
})



# more unit tests for ties
x <- c(1,1,1,1,2,3,4,5,6)
x2 <- c(6,6,6,6,5,4,3,2,1)
x3 <- rep(1,9)
x4 <- c(1,2,2,2,2,2,2,2,3)
x5 <- c(1,1,2,2,2,3,3,3,3)
grp <- as.factor(c('A','A','B','B','B','D','D','D','D'))

result <- c(3.000, 3.000, 3.000, 3.000, 6.000, 6.875, 7.625, 8.375, 9.125)
result2 <- c(7.000, 7.000, 7.000, 7.000, 4.000, 3.125, 2.375, 1.625, 0.875)
result3 <- rep(5, 9)
result4 <- c(1.250, 5.375, 5.375, 5.375, 5.375, 5.375, 5.375, 5.375, 9.125)
result5 <- c(2, 2, 5, 5, 5, 8, 8, 8, 8)

test_that("function pseudorank: ties over groups 2", {
  expect_equivalent(pseudorank::pseudorank(x,grp), result)
  expect_equivalent(pseudorank::pseudorank(x,grp),(pseudorank::pseudorank(x,grp, ties.method="min")+pseudorank::pseudorank(x,grp, ties.method = "max"))*1/2 )
  
  expect_equivalent(pseudorank::pseudorank(x2,grp), result2)
  expect_equivalent(pseudorank::pseudorank(x2,grp),(pseudorank::pseudorank(x2,grp, ties.method="min")+pseudorank::pseudorank(x2,grp, ties.method = "max"))*1/2 )
  
  expect_equivalent(pseudorank::pseudorank(x3,grp), result3)
  expect_equivalent(pseudorank::pseudorank(x3,grp),(pseudorank::pseudorank(x3,grp, ties.method="min")+pseudorank::pseudorank(x3,grp, ties.method = "max"))*1/2 )
  
  expect_equivalent(pseudorank::pseudorank(x4,grp), result4)
  expect_equivalent(pseudorank::pseudorank(x4,grp),(pseudorank::pseudorank(x4,grp, ties.method="min")+pseudorank::pseudorank(x4,grp, ties.method = "max"))*1/2 )
  
  expect_equivalent(pseudorank::pseudorank(x5,grp), result5)
  expect_equivalent(pseudorank::pseudorank(x5,grp),(pseudorank::pseudorank(x5,grp, ties.method="min")+pseudorank::pseudorank(x5,grp, ties.method = "max"))*1/2 )
  
})
