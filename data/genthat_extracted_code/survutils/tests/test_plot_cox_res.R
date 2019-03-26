context("Plot Cox regression")

endpoint <- "time"
endpoint.code <- "status"

features <- c("age")
cox_res_df <- get_cox_res(survival::colon, endpoint, endpoint.code, features)

test_that("plot_cox_res adds significance line correctly", {
  expect_s3_class(plot_cox_res(cox_res_df)$layers[[3]]$geom, "GeomVline")

  # When plot is coordinate flipped, then the significance line orientation 
  # should also be flipped.
  expect_s3_class(
    plot_cox_res(cox_res_df, coord.flip = TRUE)$layers[[3]]$geom, "GeomHline"
  )
})

test_that("plot_cox_res suppresses significance line correctly", {
  cur_plot <- plot_cox_res(cox_res_df, add_sig_line = FALSE)

  geoms <- c()
  for (cur_layer in cur_plot$layers) {
    geoms <- c(class(cur_layer$geom), geoms)
  }
  geoms <- unique(geoms)

  expect_false("GeomVline" %in% geoms)
  expect_false("GeomHline" %in% geoms)
})
