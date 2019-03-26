
context("Position of text on bar")

## create data example
v1 <- LETTERS[1:4]
v2 <- c(9, 7, 70, 99)
df <- data.frame(v1, v2)

fig1 <- regbar(df, v1, v2)

## 1 or 0
min1 <- 0.1 * max(df$v2)
df$u <- ifelse(df$v2 < min1, 0, 1)


test_that("0 when value < 10% of max value else 1", {

  ## 1 or 0
  min1 <- 0.1 * max(df$v2)
  df$u <- ifelse(df$v2 < min1, 0, 1)

  expect_equal(fig1$data[, "ypos"], df$u)

})


## test_that("Add 3% of max value when ypos is 1", {

##   ## Add 3% of max value
##   pos <- 0.03 * max(df$v2)
##   df$var2 <- ifelse(df$u == 0, df$v2 + pos, df$v2 - pos)

##   expect_identical(fig1$data[, "txtpos"], df$var2)
## })
