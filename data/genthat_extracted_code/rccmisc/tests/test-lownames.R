context("lownames")

df <- data.frame(Hello = 1:10, World = 1:10)
df2 <- cbind(df, df)
df3 <- cbind(df, lownames(df))

test_that("", {
  expect_that(lownames(df), is_equivalent_to(df))
  expect_that(names(lownames(df)), is_equivalent_to(c("hello", "world")))
  expect_that(lownames(df2), gives_warning())
})