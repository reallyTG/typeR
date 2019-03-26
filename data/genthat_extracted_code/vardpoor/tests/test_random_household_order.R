# Test for estimation of regression residuals for vardomh
# Data are randomly ordered

require(vardpoor)

# n <- 600L
# l <- 3L

test_unordered_residuals <- function(n = 600L, l = 3L) {

  # n - numper of persons in sample
  # l - number of persons in a household
  # m - number of households in sample

  m <- n / l

  # Data of persons
  datY <- data.table(IDp = 1:n,
                     IDh = rep(1:m, each = l),
                     y = sample(0:1, n, replace = T),
                     strata = 1L,
                     rnd = runif(n))

  # PSU
  datY[, psu := floor((IDh - 1) / 10) + 1L]
  datY[, IDh := as.character(IDh)]

  # Data of households
  datX <- data.table(IDh = as.character(1:m),
                     x0 = 1L,
                     x1 = sample(0:3, m, replace = T),
                     x2 = sample(0:3, m, replace = T),
                     wd = sample(1:5, m, replace = T),
                     g = rnorm(m, 1, 0.1),
                     q = runif(m),
                     rnd = runif(m))

  # Calibrated weight
  datX[, wc := wd * g]

  # Add calibrated weight to households
  datY <- merge(datY, datX[, .(IDh, wc)], by = "IDh")

  # Estimate of Y total by households
  totY <- datY[, .(y = sum(y)), keyby = IDh]

  # Set random order
  setorder(datX, rnd)
  setorder(datY, rnd)

  tmpX <- merge(datX, totY, by = "IDh")

  tmpX[, yres := residual_est(Y = y, X = .SD[, .(x0, x1, x2)],
                              weight = wd, q = q)]

  res <- vardomh(Y = "y",
                 H = "strata",
                 PSU = "psu",
                 w_final = "wc",
                 ID_level1 = "IDh",
                 ID_level2 = "IDp",
                 dataset = datY,
                 X = paste0("x", 0:2),
                 X_ID_level1 = "IDh",
                 g = "g",
                 q = "q",
                 datasetX = datX,
                 outp_res = T)

  tmp <- merge(tmpX, res$res_out[, .(IDh, yres2 = y)], by = "IDh")

  return(list(tmp[, yres], tmp[, yres2]))
}

test_that("Test estimatation of residuals in vardomh",{
  results <- test_unordered_residuals()
  expect_equal(results[[1]], results[[2]])
})
