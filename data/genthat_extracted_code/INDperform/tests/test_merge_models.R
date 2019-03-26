context("test merge_models")

mod_tbl1 <- model_gam_ex[model_gam_ex$id %in% 65:67,
  1:3]
mod_tbl1b <- dplyr::bind_rows(mod_tbl1, mod_tbl1)
mod_tbl2a <- model_gamm_ex[model_gamm_ex$id %in% 68:69 &
  model_gamm_ex$corrstruc == "ar1", 1:3]  # this one is fine
mod_tbl2b <- model_gamm_ex[model_gamm_ex$id %in% 67:68 &
  model_gamm_ex$corrstruc == "ar1", 1:3]  # overlapping ids across tibbles
mod_tbl2c <- model_gamm_ex[model_gamm_ex$id %in% 68:69 &
  model_gamm_ex$corrstruc == "ar1", c(1:2, 4:5)]  # non-overlapping variables
mod_tbl2d <- model_gamm_ex[model_gamm_ex$id %in% 68:69,
  1:3]
# multiple occurrences of id 4 and 5 in tibble (all
# corrstruc)
test <- merge_models(mod_tbl1, mod_tbl2a)

test_that("check if merging is correct", {
  expect_equal(nrow(test), (nrow(mod_tbl1) + nrow(mod_tbl2a)))
  expect_true(all(names(test) %in% unique(names(mod_tbl1),
    names(mod_tbl2a))) & all(unique(names(mod_tbl1),
    names(mod_tbl2a)) %in% names(test)))
})



test_that("check warnings and messages", {
  expect_error(merge_models(mod_tbl1), "Argument mod_tbl2 is missing")
  expect_error(merge_models(mod_tbl2 = mod_tbl2),
    "Argument mod_tbl1 is missing")
  expect_message(merge_models(mod_tbl1, mod_tbl2c))
  expect_error(merge_models(mod_tbl1, mod_tbl2b),
    "occur in both tibbles")
  expect_error(merge_models(mod_tbl1, mod_tbl2d),
    "occur in mod_tbl2")
  expect_error(merge_models(mod_tbl1b, mod_tbl2a),
    "occur in mod_tbl1")
  expect_error(merge_models(mod_tbl1b, mod_tbl2d),
    "occur in mod_tbl1")
  # (stopped already at error in mod_tbl1b, so error
  # in mod_tbl2d not even checked)
})
