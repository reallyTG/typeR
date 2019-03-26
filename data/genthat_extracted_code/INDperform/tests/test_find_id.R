context("test find_id")

ids <- model_gam_ex[, c(1:3)]
pv <- "Tsum"
iv <- "TZA"

test_that("test functions calls to find id ", {
  expect_equal(find_id(ind_name = iv, mod_tbl = ids)$id,
    model_gam_ex$id[model_gam_ex$ind == iv])
  expect_equal(find_id(press_name = pv, mod_tbl = ids)$id,
    model_gam_ex$id[model_gam_ex$press == pv])
  expect_equal(find_id(mod_tbl = model_gam_ex[1:10,
    c(1:3)])$id, model_gam_ex$id[1:10])
  expect_equal(find_id(ind_name = iv, press_name = pv,
    mod_tbl = ids)$id, model_gam_ex$id[model_gam_ex$ind ==
    iv & model_gam_ex$press == pv])
})

test_that("error messages", {
  expect_error(find_id(ind_name = iv), "Argument mod_tbl is missing")
})
