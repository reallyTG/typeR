# context("test plots")
#
# # Based:on vdiffr package:
# # https://github.com/lionel-/vdiffr
#
# # Add new reference with vdiffr::validate_cases()
# # --> svg-file is created in tests/figs/subfolder
# # Test tests with vdiffr::validate_cases() N = New
# # visual case X = Failed doppelganger o =
# # Convincing doppelganger
#
# # To test specific files only (otherwise testhat()
# # is performed on all tests):
# # vdiffr::validate_cases(cases =
# # vdiffr::collect_cases(filter = '_plot'))
#
# # Use the shiny app to identify problems
# # vdiffr::manage_cases(filter = '_plot') Toggle:
# # Left-klick to switch between new & old version
# # Slide: Left-klick + move to identify specific
# # differences Diff: Black = match, white = no match
#
# # -------------------------------------------------
#
# # Test helper_plot_diagnostics functions: ---------
#
# # Test plot_cook()
# test_plot_cook <- plot_cook(cooks_dist_gamm(gamm_model = model_gamm_ex$model[[1]]$gam))
#
# # Test plot_tac()
# resid <- mgcv::residuals.gam(all_results_ex$model[[1]])
# # No outliers in the first model - correction with
# # NAs not needed
# acf_lag <- as.vector(stats::acf(resid, na.action = stats::na.pass,
#   plot = FALSE)$lag)
# acf <- test_tac(model_resid = list(resid))$acf[[1]]
# test_plot_tac <- plot_acf(acf_lag, acf)
#
# # Test plot_resid()
# pred <- calc_pred(all_results_ex$model[1], ind_init_ex$press_train[1])$pred[[1]]
# test_plot_resid <- plot_resid(model_resid = resid,
#   model_fitted = pred)
#
# # Test plot_qq() quan_normal <- quantile(x =
# # rnorm(length(resid))) -> if i run this I would
# # get an error every time so i only ran it once and
# # hardcoded the test
# theo_quan <- seq(from = -2.0533143, to = 2.0820291,
#   by = (2.0820291 + 2.0533143)/(length(resid) - 1))
# # (seq from min to max)
# test_plot_qq <- plot_qq(resid, theo_quan)
#
# # Test ggcv_plot()
# t_val <- all_results_ex$thresh_models[[6]][[1]]$t_val
# gcvv <- all_results_ex$thresh_models[[6]][[1]]$gcvv
# lab <- all_results_ex$thresh_models[[6]][[1]]
# min_t_val <- all_results_ex$thresh_models[[6]][[1]]$mr
# test_plot_gcvv <- plot_gcvv(x_var = t_val, y_var = gcvv,
# 	lab = lab,	best_t_val = min_t_val)
#
#
#
# test_that("plot_diagnostics", {
#   vdiffr::expect_doppelganger("diagnostic plots plot cook",
#     test_plot_cook)
#   vdiffr::expect_doppelganger("diagnostic plots plot tac",
#     test_plot_tac)
#   vdiffr::expect_doppelganger("diagnostic plots plot resid",
#     test_plot_resid)
#   vdiffr::expect_doppelganger("diagnostic plots plot qq",
#     test_plot_qq)
#   vdiffr::expect_doppelganger("diagnostic plots plot gcvv",
#     test_plot_gcvv)
# })
#
#
# # Test helper function for plot_trend() ---------
# time <- model_trend_ex$time_train[[1]]
# ind <- model_trend_ex$ind_train[[1]]
# pred <- model_trend_ex$pred[[1]]
# ci_up <- model_trend_ex$ci_up[[1]]
# ci_low <- model_trend_ex$ci_low[[1]]
# x_range <- range(time)
# y_range <- range(c(ind, pred, ci_up, ci_low), na.rm = TRUE)
# pos_text <- place_text(x = x_range, y = y_range, x_prop = 0,
#   y_prop = 0.1, pos = "topleft")
#
# trend_plot <- plot_helper(time, ind, pred, ci_up, ci_low,
#   ylab = "y", pos_text, label = "Test!")
#
# test_that("plot_trend", {
#   vdiffr::expect_doppelganger("plot trend", trend_plot)
# })
#
#
# # Test helper_plot_model functions: ---------
#
# # Test plot_response()
# x <- ind_init_ex$press_train[[1]]
# y <- ind_init_ex$ind_train[[1]]
# x_seq <- seq(min(x), max(x), length.out = length(x))
# predict <- calc_pred(all_results_ex$model[1], list(x_seq)[1])
# pos_text <- place_text(x = range(x), y = range(y, predict$ci_up[[1]],
#   predict$ci_up[[1]], predict$ci_low[[1]]), x_prop = 0,
#   y_prop = 0.1, pos = "topleft")
#
# test_plot_response <- plot_response(x = x, y = y, x_seq = x_seq,
#   pred = predict$pred[[1]], ci_up = predict$ci_up[[1]],
#   ci_low = predict$ci_low[[1]], xlab = "x", ylab = "y",
#   pos_text = pos_text, label = "Test!")
#
# ####check_plot <- test_plot_response
#
# # Test plot_predict()
# x <- c(ind_init_ex$time_train[[1]], ind_init_ex$time_test[[1]])
# y <- c(ind_init_ex$ind_train[[1]], ind_init_ex$ind_test[[1]])
# press <- c(ind_init_ex$press_train[[1]], ind_init_ex$press_test[[1]])
# pred <- calc_pred(model_list = all_results_ex$model[1],
#   obs_press = list(press))$pred[[1]]
# ci_up <- calc_pred(model_list = all_results_ex$model[1],
#   obs_press = list(press))$ci_up[[1]]
# ci_low <- calc_pred(model_list = all_results_ex$model[1],
#   obs_press = list(press))$ci_low[[1]]
# x_train <- 1:27
# x_test <- 28:30
# zoom <- c((min(x_test) - 2):(max(x_test) + 1))
# x_zoom <- na.exclude(x[zoom])
# x_range <- c((range(x[x_test])[1] - 2), (range(x[x_test])[2] +
#   1))
# y_range <- range(c(y[zoom], pred[zoom], ci_up[zoom],
#   ci_low[zoom]), na.rm = TRUE)
# pos_text <- place_text(x = x_range, y = y_range, x_prop = 0,
#   y_prop = 0.05, pos = "topleft")
#
# test_plot_predict <- plot_predict(x = x, y_obs = y,
#   y_pred = pred, ci_up = ci_up, ci_low = ci_low,
#   x_train, x_test, zoom, x_range, y_range, xlab = "x",
#   ylab = "y", pos_text = pos_text, label = "Test!")
#
# # Test plot_deriv()
# x_range <- suppressWarnings(range(all_results_ex$press_seq[[5]]))
# # (suppressWarnings needed because some lists are
# # empty)
# y_range <- suppressWarnings(range(all_results_ex$deriv1[[5]],
#   all_results_ex$deriv1_ci_up[[5]], all_results_ex$deriv1_ci_low[[5]]))
# pos_text <- place_text(x = x_range, y = y_range, x_prop = 0,
#   y_prop = 0.1, pos = "topleft")
#
# test_plot_deriv <- plot_deriv(press_seq = all_results_ex$press_seq[[5]],
#   deriv1 = all_results_ex$deriv1[[5]], deriv1_ci_low = all_results_ex$deriv1_ci_low[[5]],
#   deriv1_ci_up = all_results_ex$deriv1_ci_up[[5]],
#   zic_start_end = all_results_ex$zic_start_end[[5]],
#   zero_in_conf = all_results_ex$zero_in_conf[[5]],
#   xlab = "x", ylab = "y", pos_text = pos_text, label = "Test!")
#
# # Test plot_thresh_model()
# test_plot_thresh <- plot_thresh(all_results_ex$thresh_models[[5]],
#   choose_thresh_gam = NULL)
#
# test_that("plot_model", {
#   vdiffr::expect_doppelganger("plot model plot derivatives",
#     test_plot_deriv)
#   vdiffr::expect_doppelganger("plot model plot response",
#     test_plot_response)
#   vdiffr::expect_doppelganger("plot model plot predict",
#     test_plot_predict)
#   vdiffr::expect_doppelganger("plot model plot tmodel",
#     test_plot_thresh)
# })
#
#
# # Test plot_spiechart() function: ---------
#
# scores_tbl <- scoring(model_trend_ex, all_results_ex,
#   press_type = INDperform::press_type_ex)
# summary_tbl <- summary_sc(scores_tbl)
# test_plot_spiechart <- plot_spiechart(summary_tbl)[[1]]
#
# # Test with crit removed
# test <- list(summary_tbl[[1]][, c(1:9)], summary_tbl[[2]])  #without C11
# test2 <- list(summary_tbl[[1]][, c(1:8, 10)], summary_tbl[[2]])  #without C10
# test3 <- list(summary_tbl[[1]][, c(1:7, 9:10)], summary_tbl[[2]])  #without C9
# test4 <- list(summary_tbl[[1]][, c(1:6, 8:10)], summary_tbl[[2]])  #without C8
# test5 <- list(summary_tbl[[1]][c(1:3, 5:7, 9:12), c(1:6,
#   8:9)], summary_tbl[[2]])  #without C8/ C11
# test6 <- list(summary_tbl[[1]][, c(1:6, 8:9)], summary_tbl[[2]])
# # (without C8/ C11 but with ind that have no sig
# # press)
# test_plot_spiechart2 <- plot_spiechart(test)[[5]]
# test_plot_spiechart3 <- plot_spiechart(test2)[[3]]
# test_plot_spiechart4 <- plot_spiechart(test3)[[5]]
# test_plot_spiechart5 <- plot_spiechart(test4)[[7]]
# test_plot_spiechart6 <- plot_spiechart(test5)[[4]]
#
# test_that("plot_spiechart", {
#   vdiffr::expect_doppelganger("plot spiechart", test_plot_spiechart)
#   vdiffr::expect_doppelganger("plot spiechart2",
#     test_plot_spiechart2)
#   vdiffr::expect_doppelganger("plot spiechart3",
#     test_plot_spiechart3)
#   vdiffr::expect_doppelganger("plot spiechart4",
#     test_plot_spiechart4)
#   vdiffr::expect_doppelganger("plot spiechart5",
#     test_plot_spiechart5)
#   vdiffr::expect_doppelganger("plot spiechart6",
#     test_plot_spiechart6)
# })
#
# # Test plot_clust_sc() function: ---------
#
# scores_tbl <- scoring(trend_tbl = model_trend_ex, mod_tbl = all_results_ex,
#   press_type = INDperform::press_type_ex)
# summary_tbl <- summary_sc(scores_tbl)
# dist_matrix <- dist_sc(summary_tbl[[3]], method_dist = "euclidean")
# clust_obj <- suppressMessages(clust_sc(dist_matrix,
#   method_clust = "complete"))
# test_plot_dendrogram <- plot_clust_sc(clust_obj)
#
# test_that("plot_clust_sc", {
#   vdiffr::expect_doppelganger("plot clust_sc", test_plot_dendrogram)
# })
#
#
# # Test plot_statespace_ed() function: ---------
#
# ind.sel <- ind_ex[, c(2, 3, 4, 8, 10, 11)]  # selection of indicators suite
# ed <- statespace_ed(x = ind.sel, time = ind_ex$Year,
#   ref_time = 1979)
# test_plot_ed <- plot_statespace_ed(x = ed)
#
# test_that("plot_statespace_ed", {
#   vdiffr::expect_doppelganger("plot statespace_ed",
#     test_plot_ed)
# })
#
#
# # Test plot_statespace_ch() function: ---------
#
# x <- statespace_ch(x = ind_ex[, 2], y = ind_ex[, 3],
#   time = ind_ex$Year, period_ref = 1979:1983, period_current = 2004:2008)
# test_plot_ch <- plot_statespace_ch(x)
#
# test_that("plot_statespace_ch", {
#   vdiffr::expect_doppelganger("plot statespace_ch",
#     test_plot_ch)
# })
#
# # Once changes have been made: --> Running testthat
# # to collect visual cases:
# # vdiffr::validate_cases(cases = vdiffr::collect_cases(filter = '_plot'))
