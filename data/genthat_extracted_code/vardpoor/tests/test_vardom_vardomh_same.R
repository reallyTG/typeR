require(vardpoor)

test_dom_domh <- function(n = 600) {
  # n - number of persons in sample
  
  strata <- sample(1:4, n, replace = T)
  dat_x <- data.table(IDp = 1:n,
                      y = 1L,
                      x0 = 1L,
                      x1 = sample(0:3, n, replace = T),
                      x2 = sample(0:3, n, replace = T),
                      wd = sample(1:5, n, replace = T),
                      g = rnorm(n, 1, 0.1),
                      q = runif(n),
                      survey = rep(1:4, each = n/4),
                      strata = strata)

  dat_x[, wc := wd * g]
  dat_y <- dat_x[, .(IDp, y, wc, survey, strata)]
  
  n_h <- data.table(strata = 1:4, pop = sample(500:1500, 4))
  
  result_a <- vardomh(Y = "y",
                      H = "strata",
                      PSU = "IDp",
                      w_final = "wc",
                      ID_level1 = "IDp",
                      ID_level2 = "IDp",
                      ind_gr = "survey",
                      N_h = n_h,
                      X = paste0("x", 0:2),
                      X_ID_level1 = "IDp",
                      g = "g",
                      q = "q",
                      dataset = dat_y,
                      datasetX = dat_x)$all_result
  
  result_b <- vardom(Y = "y",
                      H = "strata",
                      PSU = "IDp",
                      w_final = "wc",
                      ind_gr = "survey",
                      N_h = n_h,
                      X = paste0("x", 0:2),
                      g = "g",
                      q = "q",
                      dataset = dat_x)$all_result

  names_a <- names(result_a)
  return(list(result_a, result_b[, .SD, .SDcols = names_a]))
}

test_that("Check that vardom and vardomh results match if level1 == level2", {
  results <- test_dom_domh()
  expect_equal(results[[1]], results[[2]])
})