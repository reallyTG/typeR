context("Plotting")

test_that("test that plotting is working correctly", {
  
  expect_error(plot_maps(data_frame()), "no rows")
  
  expect_true(file.exists(folder <- system.file("extdata", "nanosims_data", "analysis1", "mat", package = "lans2r")))
  expect_true(is(data <- read_map_data(folder), "data.frame"))
  expect_true(is(data_w_rois <- lans2r:::extract_roi_boundaries(data), "data.frame"))
  expect_equal(nrow(data_w_rois), 9764L)
  expect_equal(names(data_w_rois), 
               c("x.px", "y.px", "frame_size.px", "x.um", "y.um", "frame_size.um", 
                 "data_type", "value", "sigma", "ROI", "roi_border", "variable"))
  expect_equal(data_w_rois$value[5], 4278) #spot check
  expect_equal(data_w_rois$variable[5], "12C") #spot check
  expect_equal(data_w_rois$roi_border[5], TRUE) #spot check
  
  expect_true(is(plot_maps(data), "ggplot"))
  # note is there a way to test the generated ggplot more thoroughly?
  
})