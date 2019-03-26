context("Test rake() function produces correct output for extract")

cons <- readr::read_csv("../cakemap_cons.csv")
inds <- readr::read_csv("../cakemap_inds.csv")
vars <- c("Car", "NSSEC8", "ageband4")

test_that("Check fraction", {
  frac_weights <- rake(cons = cons, inds = inds, vars = vars,
                       output = "fraction", id = "code")

  lapply(frac_weights[, 3:ncol(frac_weights)], function(x) {
    expect_is(x, "numeric")
  })
})


context("Test rake() function produces correct output for integer")

test_that("Check integer", {
  int_weights <- rake(cons = cons, inds = inds, vars = vars,
                      output = "integer",
                      seed = 42, method = "trs")

  expect_equal(nrow(int_weights), sum(cons[, c("car_no", "car_yes")]))
})
