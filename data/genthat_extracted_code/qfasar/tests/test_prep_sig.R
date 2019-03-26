library(qfasar)
context("Test signature preparation")

# Scale equal 1
test_obj <- prep_sig(df_sig = data.frame(type = c("Type_1", "Type_1", "Type_2",
                                                  "Type_2"),
                                         id = c("ID_1", "ID_2", "ID_3", "ID_4"),
                                         fa_1 = c(0.0, 0.2, 0.3, 0.6),
                                         fa_2 = c(0.1, 0.3, 0.3, 0.4),
                                         fa_3 = c(0.9, 0.5, 0.4, NA),
                                         row.names = c("Prey_1", "Prey_2", "Prey_3",
                                                       "Prey_4")),
                     fa_names = c("fa_1", "fa_2", "fa_3"),
                     use_fa = c(TRUE, FALSE, TRUE),
                     zero_rep = 90,
                     scale=1)

test_that("Replacements of zero and NA are correct",{
  expect_equivalent(round(test_obj$sig_rep[,1], 3),
                    c(0.090, 0.091, 0.819))
  expect_equivalent(round(test_obj$sig_rep[,2], 3),
                    c(0.200, 0.300, 0.500))
  expect_equivalent(round(test_obj$sig_rep[,3], 3),
                    c(0.300, 0.300, 0.400))
  expect_equivalent(round(test_obj$sig_rep[,4], 3),
                    c(0.546, 0.364, 0.090))
})

