context("Check rodent stake data")

portal_data_path <- tempdir()

test_that("summarize_individual_rodents returns expected columns", {
  stake_data <- summarize_individual_rodents(path = portal_data_path)
  expect_equal(names(stake_data), c("period","month","day","year","treatment","plot",
                                    "stake","species","sex","hfl","wgt","tag","ltag"))

  filled_stake_data = summarize_individual_rodents(path = portal_data_path, type = "granivores",
                                                   length = "all", unknowns = T, min_plots = 1,
                                                   time = "newmoon", fillweight = T)
  expect_equal(names(filled_stake_data), c("newmoonnumber","month","day","year","treatment","plot",
                                           "stake","species","sex","hfl","wgt","tag","ltag"))

})
