context("test-bins")

test_that("winsorized binning works as expected", {
  k <- rbin_winsorize(mbank, y, age, 10, winsor_rate = 0.05)
  expect_equal(sum(k$bins$bin_count), 4521)
})

test_that("quantile binning works as expected", {
  k <- rbin_quantiles(mbank, y, age, 10)
  expect_equal(sum(k$bins$bin_count), 4521)
})

test_that("manual binning works as expected", {
  k <- rbin_manual(mbank, y, age, c(29, 31, 34, 36, 39, 42, 46, 51, 56))
  expect_equal(sum(k$bins$bin_count), 4521)
})

test_that("equal length binning works as expected", {
  k <- rbin_equal_length(mbank, y, age, 10)
  expect_equal(sum(k$bins$bin_count), 4521)
})

test_that("equal frequency binning works as expected", {
  k <- rbin_equal_freq(mbank, y, age, 10)
  expect_equal(sum(k$bins$bin_count), 4521)
})

test_that("output from rbin_create is as expected as expected", {
  k <- rbin_manual(mbank, y, age, c(29, 31, 34, 36, 39, 42, 46, 51, 56))
  out <- rbin_create(mbank, age, k)
  expect_equal(ncol(out), 26)
})  

test_that("output from rbin_factor_combine is as expected", {
  upper <- c("secondary", "tertiary")
  out <- rbin_factor_combine(mbank, education, upper, "upper")
  expect_equal(nlevels(out$education), 3)
})

test_that("output from rbin_factor is as expected", {
  bins <- rbin_factor(mbank, y, education)
  expect_equal(round(sum(bins$bins$iv), 2), 0.05)
})

test_that("output from rbin_factor_create is as expected", {
  upper <- c("secondary", "tertiary")
  out <- rbin_factor_combine(mbank, education, upper, "upper")
  result <- rbin_factor_create(out, education)
  expect_equal(ncol(result), 19)
})

test_that("output from rbin_print is as expected", {

  x <- cat("Binning Summary
---------------------------
Method               Manual 
Response             y 
Predictor            age 
Bins                 10 
Count                4521 
Goods                517 
Bads                 4004 
Entropy              0.5 
Information Value    0.12 


# A tibble: 10 x 7
   cut_point bin_count  good   bad      woe         iv entropy
   <chr>         <int> <int> <int>    <dbl>      <dbl>   <dbl>
 1 < 29            410    71   339 -0.484   0.0255       0.665
 2 < 31            313    41   272 -0.155   0.00176      0.560
 3 < 34            567    55   512  0.184   0.00395      0.459
 4 < 36            396    45   351  0.00712 0.00000443   0.511
 5 < 39            519    47   472  0.260   0.00701      0.438
 6 < 42            431    33   398  0.443   0.0158       0.390
 7 < 46            449    47   402  0.0993  0.000942     0.484
 8 < 51            521    40   481  0.440   0.0188       0.391
 9 < 56            445    49   396  0.0426  0.000176     0.500
10 >= 56           470    89   381 -0.593   0.0456       0.700")

  bins <- rbin_manual(mbank, y, age, c(29, 31, 34, 36, 39, 42, 46, 51, 56))
  expect_output(print(bins), x)

})

test_that("output from rbin_print_custom  is as expected", {

  x <- cat("Binning Summary
---------------------------
Method               Custom 
Response             y 
Predictor            education 
Levels               4 
Count                4521 
Goods                517 
Bads                 4004 
Entropy              0.51 
Information Value    0.05 


# A tibble: 4 x 7
  level     bin_count  good   bad    woe      iv entropy
  <fct>         <int> <int> <int>  <dbl>   <dbl>   <dbl>
1 tertiary       1299   195  1104 -0.313 0.0318    0.610
2 secondary      2352   231  2121  0.170 0.0141    0.463
3 unknown         179    25   154 -0.229 0.00227   0.583
4 primary         691    66   625  0.201 0.00572   0.455")

  bins <- rbin_factor(mbank, y, education)
  expect_output(print(bins), x)

})