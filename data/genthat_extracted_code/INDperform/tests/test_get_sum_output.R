context("test get_sum_output")

dat <- get_sum_output(sum_list = purrr::map(model_gam_ex$model,
  ~mgcv::summary.gam(.)), varname = "edf")
dat2 <- get_sum_output(sum_list = purrr::map(model_gam_ex$model,
  ~mgcv::summary.gam(.)), varname = "dev.expl")
choose <- !is.na(model_gamm_ex$aic)
dat3 <- get_sum_output(sum_list = purrr::map_if(model_gamm_ex$model,
  choose, ~mgcv::summary.gam(.$gam)), varname = "r.sq")
dat4 <- get_sum_output(sum_list = purrr::map_if(model_gamm_ex$model,
  choose, ~mgcv::summary.gam(.$gam)), varname = "s.table",
  cell = 4)


test_that("test class and value of get_sum_output",
  {
    expect_is(dat, "numeric")
    expect_equal(dat, model_gam_ex$edf)
    expect_is(dat2, "numeric")
    expect_equal(dat2, model_gam_ex$expl_dev)
    expect_is(dat3, "numeric")
    expect_equal(dat3, model_gamm_ex$r_sq)
    expect_is(dat4, "numeric")
    expect_equal(dat4, model_gamm_ex$p_val)
    expect_true(all(is.na(dat3[is.na(model_gamm_ex$model)]) ==
      TRUE))
  })

test_that("check errors", {
  expect_error(get_sum_output(sum_list = purrr::map(model_gam_ex$model,
    ~mgcv::summary.gam(.)), varname = "se"))
  expect_error(get_sum_output(sum_list = purrr::map_if(model_gamm_ex$model,
    choose, ~mgcv::summary.gam(.$gam)), varname = "s.table"))
})
