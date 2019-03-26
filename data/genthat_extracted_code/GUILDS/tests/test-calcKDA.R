context("calcKDA")

test_that("calcKDA use", {
  skip_on_cran()
  sad <- 1:20
  kda_1 <- calcKDA(sad)
 
  kda_2 <- calcKDA(c(sad,1000))
  kda_3 <- calcKDA(c(sad,10000))
  kda_4 <- calcKDA(c(sad,25000))
})