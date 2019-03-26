context("replacement-flags")



vec <- c(1, 1, "*", "-", 5)    
replacementn99 <- data.frame(flag = c("*", "-"), rep=c(-99))
replacementn99unn <- data.frame(flag = unique_non_numerics(vec), rep=c(-99))
correct_outputn99 <- c(1, 1, -99, -99, 5)
correct_outputn99_repNA <- c(NA, NA, -99, -99, NA)
correct_outputn1n2 <- c(1, 1, -1, -2, 5)
correct_output_wzero <- list(0, 0, 1, 2, 0)

test_that("list elements replaced properly", {
  expect_equal(replace_values(vec, replacementn99), correct_outputn99)
  expect_equal(replace_values(vec, replacementn99,nonflag = NA), correct_outputn99_repNA)

})

test_that("non numerics flags correctly", {
  expect_equal(replacementn99, replacementn99unn) 
})