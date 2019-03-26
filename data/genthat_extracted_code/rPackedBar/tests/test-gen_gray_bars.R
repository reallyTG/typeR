context("gen gray bars")

test_that("output object class and structure", {
  suppressWarnings(RNGversion("3.5.0"))
  set.seed(42)
  plot_df = data.frame(lab=letters,
                       val=rexp(26),
                       stringsAsFactors = FALSE)

  plot_df$max_rel_val = plot_df$val/sum(plot_df$val)

  color_output = gen_color_bars(plot_df, number_rows=3, bar_color='blue', label_column='lab', min_label_width=.03, 'black')

  output = gen_gray_bars(plot_df, number_rows=3,
                         color_output$raw_data,
                         "lab", min_label_width=0.03)

  expect_identical(class(output), "list")

  expect_identical(class(output$raw_data), "data.frame")
  expect_identical(dim(output$raw_data), c(23L,3L))

  expect_identical(class(output$bar_list), "list")
  expect_identical(length(output$bar_list), 23L)
  expect_identical(lapply(output$bar_list, length),
                   list(9L, 9L, 9L, 9L, 9L, 9L, 9L, 9L,
                        9L, 9L, 9L, 9L, 9L, 9L, 9L, 9L,
                        9L, 9L, 9L, 9L, 9L, 9L, 9L))
  expect_identical(names(output$bar_list[[1]]),
                   c("type", "fillcolor", "line",
                     "x0", "x1", "xref", "y0", "y1", "yref"))
  expect_identical(lapply(output$bar_list[[1]], class),
                   list(type = "character", fillcolor = "character", line = "list",
                        x0 = "numeric", x1 = "numeric", xref = "character", y0 = "numeric",
                        y1 = "numeric", yref = "character"))

  expect_identical(class(output$ann_list), "list")
  expect_identical(length(output$ann_list), 6L)
  expect_identical(lapply(output$ann_list, length),
                   list(6L, 6L, 6L, 6L, 6L, 6L))
  expect_identical(names(output$ann_list[[1]]),
                   c("x", "y", "xref", "yref", "text", "showarrow"))
  expect_identical(lapply(output$ann_list[[1]], class),
                   list(x = "numeric", y = "numeric", xref = "character",
                        yref = "character", text = "character", showarrow = "logical"))

  expect_identical(class(output$hover_point_dt), c("data.table", "data.frame"))
  expect_identical(dim(output$hover_point_dt), c(230L,4L))
  expect_identical(names(output$hover_point_dt), c("name", "x", "y", "size"))
  expect_identical(lapply(output$hover_point_dt, class), list(name = "character", x = "numeric",
                                                              y = "numeric", size = "numeric"))

})
