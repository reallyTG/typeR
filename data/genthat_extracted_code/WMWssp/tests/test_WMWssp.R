context("WMWssp")

# data
x <- c(315,375,356,374,412,418,445,403,431,410,391,475,379)
y <- x - 20

# calculate sample size, true result
result_WMWsspN <- 111.3719511
result_WMWsspp <- 0.3491124
result_power <- 0.9 # 0.7

suppressWarnings(RNGversion("3.5.0"))
set.seed(1)
result_simpower <- WMWssp::WMWssp(x, y, alpha = 0.05, power = 0.8, t = 1/2, simulation = TRUE, nsim = 10)$result[3, ]



test_that("function WMWssp", {
  expect_equivalent(WMWssp::WMWssp(x, y, alpha = 0.05, power = 0.8, t = 1/2)$result[4,], result_WMWsspN, tolerance=1e-4)
  expect_equivalent(WMWssp::WMWssp(x, y, alpha = 0.05, power = 0.8, t = 1/2)$result[3,], result_WMWsspp, tolerance=1e-4)
  expect_output(print(WMWssp::WMWssp(x, y, alpha = 0.05, power = 0.8, t = 1/2)))
  expect_output(summary(WMWssp::WMWssp(x, y, alpha = 0.05, power = 0.8, t = 1/2)))
  expect_equivalent(result_power, result_simpower)
})


