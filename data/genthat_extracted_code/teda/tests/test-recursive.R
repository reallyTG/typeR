library(teda)

p_one = teda_r(20)
p_two = teda_r(12,
               p_one$curr_mean,
               p_one$curr_var,
               p_one$next_k)
p_three = teda_r(10,
                 p_two$curr_mean,
                 p_two$curr_var,
                 p_two$next_k)
p_four = teda_r(50,
                p_three$curr_mean,
                p_three$curr_var,
                p_three$next_k)


test_that("Position one values are correct?", {
  expect_equal(p_one$curr_observation, 20)
  expect_equal(p_one$curr_mean, 20)
  expect_equal(p_one$curr_var, 0)
  expect_equal(p_one$outlier, NA)
  expect_equal(p_one$curr_eccentricity, NaN)
  expect_equal(p_one$curr_typicality, NaN)
  expect_equal(p_one$curr_norm_eccentricity, NaN)
  expect_equal(p_one$curr_norm_typicality, NaN)
})

test_that("Position two values are correct?", {
  expect_equal(p_two$curr_observation, 12)
  expect_equal(p_two$curr_mean, 16)
  expect_equal(p_two$curr_var, 16)
  expect_equal(p_two$outlier, FALSE)
  expect_equal(p_two$curr_eccentricity, 1)
  expect_equal(p_two$curr_typicality, 0)
  expect_equal(p_two$curr_norm_eccentricity, 0.5)
  expect_equal(p_two$curr_norm_typicality, NaN)
  expect_equal(p_two$ecc_threshold, 0.5)
})

test_that("Position three values are correct?", {
  expect_equal(p_three$curr_observation, 10)
  expect_equal(p_three$curr_mean, 14)
  expect_equal(p_three$curr_var, 18.667)
  expect_equal(p_three$outlier, FALSE)
  expect_equal(p_three$curr_eccentricity, 0.619)
  expect_equal(p_three$curr_typicality, 0.381)
  expect_equal(p_three$curr_norm_eccentricity, 0.31)
  expect_equal(p_three$curr_norm_typicality, 0.381)
  expect_equal(p_three$ecc_threshold, 0.333)
})

test_that("Position four values are correct?", {
  expect_equal(p_four$curr_observation, 50)
  expect_equal(p_four$curr_mean, 23)
  expect_equal(p_four$curr_var, 257)
  expect_equal(p_four$outlier, TRUE)
  expect_equal(p_four$curr_eccentricity, 0.959)
  expect_equal(p_four$curr_typicality, 0.041)
  expect_equal(p_four$curr_norm_eccentricity, 0.48)
  expect_equal(p_four$curr_norm_typicality, 0.02)
  expect_equal(p_four$ecc_threshold, 0.25)
})
