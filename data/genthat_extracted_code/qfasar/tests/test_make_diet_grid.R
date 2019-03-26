library(qfasar)
context("Test diet grid")

test_obj <- make_diet_grid(uniq_types = as.factor(c("Bearded",
                                                    "Beluga",
                                                    "Bowhead",
                                                    "Ribbon",
                                                    "Ringed",
                                                    "Spotted",
                                                    "Walrus")),
                           inv_inc = 2)

test_that("Diet grid is correct",{
  expect_equivalent(dim(test_obj$diet_grid),
                    c(7, 28))
  expect_equivalent(test_obj$diet_grid[,2],
                    c(0.5, 0.5, 0, 0, 0, 0, 0))
  expect_equivalent(min(colSums(test_obj$diet_grid)), 1)
  expect_equivalent(max(colSums(test_obj$diet_grid)), 1)
})

