context("Noether Minimize and Maximize")

# data
x <- c(315,375,356,374,412,418,445,403,431,410,391,475,379)
y <- x - 20
N <- 112

# calculate sample size, true result
result_t_max <- 0.4964661
result_t_min <- 0.4964905
result_power <- 0.9200000 #0.76

#temporary fix
suppressWarnings(RNGversion("3.5.0"))
set.seed(1)
result_simpower <- summary(WMWssp::WMWssp_minimize(x, y, simulation = TRUE, nsim = 50))[3, ]

test_that("function WMWssp_maximize", {
  expect_equivalent(WMWssp::WMWssp_maximize(x, y, alpha = 0.05, N)$t, result_t_max, tolerance=1e-4)
})

test_that("function WMWssp_minimize", {
  expect_equivalent(WMWssp::WMWssp_minimize(x, y)$t, result_t_min, tolerance=1e-4)
  expect_output(summary(WMWssp::WMWssp_minimize(x, y)))
  expect_output(print(WMWssp::WMWssp_minimize(x, y)))
  expect_equivalent(result_power, result_simpower)
  expect_output(summary(WMWssp::WMWssp_minimize(x, y, simulation = TRUE, nsim = 10)))
  expect_output(print(WMWssp::WMWssp_minimize(x, y, simulation = TRUE, nsim = 10)))
})
