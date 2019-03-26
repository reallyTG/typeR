################################################################################
# Test if trafo functions return the same results as the manually calculated
# values
################################################################################

# Case A: positive values (y1 = 1, y2 = 2) and positive lambda (lambda = 3)

# Fixed optimal parameter and shift (benchmark values)
manual_results <- read.csv("./A_y1_y2_lambda3.csv", sep=";")

test_that("Does the Box-Cox transformation return the correct results?", {

  # Define y vector
  y <- c(1, 2) # n = 2
  
  # Box-Cox transformation
  yt <- box_cox(2, 3)
  yback <- box_cox_back(yt, 3)
  z <- box_cox_std(y, 3)
  
  # Check transformation
  expect_equal(round(yt, 3), round(manual_results[1, "box_cox"], 3))
  # Check back-transformation
  expect_equal(yback, y[2])
  # Check standardized transformation
  expect_equal(round(z[1], 3), round(manual_results[2, "box_cox"], 3))
  expect_equal(round(z[2], 3), round(manual_results[3, "box_cox"], 3))
})

test_that("Does the Box-Cox shift transformation return the correct results?", {

  # Define y vector
  y <- c(1, 2) # n = 2

  # Box-Cox transformation
  yt <- box_cox_shift(2, 3)$y
  yback <- box_cox_shift_back(yt, 3)
  z <- box_cox_shift_std(y, 3)

  # Check transformation
  expect_equal(round(yt, 3), round(manual_results[1, "box_cox"], 3))
  # Check back-transformation
  expect_equal(yback, y[2])
  # Check standardized transformation
  expect_equal(round(z[1], 3), round(manual_results[2, "box_cox"], 3))
  expect_equal(round(z[2], 3), round(manual_results[3, "box_cox"], 3))


})


test_that("Does the Modulus transformation return the correct results?", {

  # Define y vector
  y <- c(1, 2) # n = 2


  # Modulus transformation
  yt <- modul(2, 3)
  yback <- modul_back(yt, 3)
  z <- modul_std(y, 3)

  # Check transformation
  expect_equal(round(yt, 3), round(manual_results[1, "modulus"], 3))
  # Check back-transformation
  expect_equal(yback, y[2])
  # Check standardized transformation
  expect_equal(round(z[1], 3), round(manual_results[2, "modulus"], 3))
  expect_equal(round(z[2], 3), round(manual_results[3, "modulus"], 3))


})


test_that("Does the Bickel-Doksum transformation return the correct results?", {

  # Define y vector
  y <- c(1, 2) # n = 2


  # Bickel-Doksum transformation
  yt <- Bick_dok(2, 3)
  yback <- Bick_dok_back(yt, 3)
  z <- Bick_dok_std(y, 3)

  # Check transformation
  expect_equal(round(yt, 3), round(manual_results[1, "bick_dok"], 3))
  # Check back-transformation
  expect_equal(yback, y[2])
  # Check standardized transformation
  expect_equal(round(z[1], 3), round(manual_results[2, "bick_dok"], 3))
  expect_equal(round(z[2], 3), round(manual_results[3, "bick_dok"], 3))


})


test_that("Does the Manly transformation return the correct results?", {

  # Define y vector
  y <- c(1, 2) # n = 2


  # Manly transformation
  yt <- Manly(2, 3)
  yback <- Manly_back(yt, 3)
  z <- Manly_std(y, 3)

  # Check transformation
  expect_equal(round(yt, 3), round(manual_results[1, "manly"], 3))
  # Check back-transformation
  expect_equal(yback, y[2])
  # Check standardized transformation
  expect_equal(round(z[1], 3), round(manual_results[2, "manly"], 3))
  expect_equal(round(z[2], 3), round(manual_results[3, "manly"], 3))
})


test_that("Does the Dual transformation return the correct results?", {

  # Define y vector
  y <- c(1, 2) # n = 2


  # Dual transformation
  yt <- Dual(2, 3)
  yback <- Dual_back(yt, 3)
  z <- Dual_std(y, 3)

  # Check transformation
  expect_equal(round(yt, 3), round(manual_results[1, "dual"], 3))
  # Check back-transformation
  expect_equal(yback, y[2])
  # Check standardized transformation
  expect_equal(round(z[1], 3), round(manual_results[2, "dual"], 3))
  expect_equal(round(z[2], 3), round(manual_results[3, "dual"], 3))
})


test_that("Does the Yeo-Johnson transformation return the correct results?", {

  # Define y vector
  y <- c(1, 2) # n = 2


  # Yeo-Johnson transformation
  yt <- Yeo_john(2, 3)
  yback <- Yeo_john_back(yt, 3)
  z <- Yeo_john_std(y, 3)

  # Check transformation
  expect_equal(round(yt, 3), round(manual_results[1, "yeo_john"], 3))
  # Check back-transformation
  expect_equal(yback, y[2])
  # Check standardized transformation
  expect_equal(round(z[1], 3), round(manual_results[2, "yeo_john"], 3))
  expect_equal(round(z[2], 3), round(manual_results[3, "yeo_john"], 3))
})

test_that("Does the Gpower transformation return the correct results?", {

  # Define y vector
  y <- c(1, 2) # n = 2


  # Gpower transformation
  yt <- gPower(2, 3)
  yback <- gPower_back(yt, 3)
  z <- gPower_std(y, 3)

  # Check transformation
  expect_equal(round(yt, 3), round(manual_results[1, "gpower"], 3))
  # Check back-transformation
  expect_equal(yback, y[2])
  # Check standardized transformation
  expect_equal(round(z[1], 3), round(manual_results[2, "gpower"], 3))
  expect_equal(round(z[2], 3), round(manual_results[3, "gpower"], 3))
})

test_that("Does the Square-root shift transformation return the correct results?", {

  # Define y vector
  y <- c(1, 2) # n = 2


  # Square-root shift transformation
  yt <- sqrt_shift(2, 3)
  yback <- sqrt_shift_back(yt, 3)
  z <- sqrt_shift_std(y, 3)

  # Check transformation
  expect_equal(round(yt, 3), round(manual_results[1, "sqrt_shift"], 3))
  # Check back-transformation
  expect_equal(yback, y[2])
  # Check standardized transformation
  expect_equal(round(z[1], 3), round(manual_results[2, "sqrt_shift"], 3))
  expect_equal(round(z[2], 3), round(manual_results[3, "sqrt_shift"], 3))
})


test_that("Does the Neglog transformation return the correct results?", {

  # Define y vector
  y <- c(1, 2) # n = 2


  # Neglog transformation
  yt <- neg_log(2)
  yback <- neg_log_back(yt)
  z <- neg_log_std(y)

  # Check transformation
  expect_equal(round(yt, 3), round(manual_results[1, "neg_log"], 3))
  # Check back-transformation
  expect_equal(yback, y[2])
  # Check standardized transformation
  expect_equal(round(z[1], 3), round(manual_results[2, "neg_log"], 3))
  expect_equal(round(z[2], 3), round(manual_results[3, "neg_log"], 3))
})


test_that("Does the glog transformation return the correct results?", {

  # Define y vector
  y <- c(1, 2) # n = 2


  # glog transformation
  yt <- g_log(2)
  yback <- g_log_back(yt)
  z <- g_log_std(y)

  # Check transformation
  expect_equal(round(yt, 3), round(manual_results[1, "glog"], 3))
  # Check back-transformation
  expect_equal(yback, y[2])
  # Check standardized transformation
  expect_equal(round(z[1], 3), round(manual_results[2, "glog"], 3))
  expect_equal(round(z[2], 3), round(manual_results[3, "glog"], 3))
})


test_that("Does the Log-shift opt transformation return the correct results?", {

  # Define y vector
  y <- c(1, 2) # n = 2


  # Log-shift opt transformation
  yt <- log_shift_opt(2, 3)
  yback <- log_shift_opt_back(yt, 3)
  z <- log_shift_opt_std(y, 3)

  # Check transformation
  expect_equal(round(yt, 3), round(manual_results[1, "log_opt"], 3))
  # Check back-transformation
  expect_equal(yback, y[2])
  # Check standardized transformation
  expect_equal(round(z[1], 3), round(manual_results[2, "log_opt"], 3))
  expect_equal(round(z[2], 3), round(manual_results[3, "log_opt"], 3))
})
