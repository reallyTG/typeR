context("Read files")

test_that("test that test files exist", {
  expect_true(file.exists(system.file("extdata", "nanosims_data", package = "lans2r")))
})

test_that("test that it is possible to read ROI data file", {
  expect_true(file.exists(file <- system.file("extdata", "nanosims_data", "analysis1", "dat", "12C.dac", package = "lans2r")))
  
  # check return values from file
  expect_true(is(data <- lans2r:::read_roi_ion_data_file(file), "data.frame"))
  
  expect_equal(data %>% nrow(), data$ROI %>% unique() %>% length())
  expect_equal(data %>% names(), c("plane", "ROI", "data_type", "variable", "value", "sigma", 
                                   "coord_x", "coord_y", "size", "pixels", "LW_ratio"))
  expect_equal(data$pixels[3], 250) # spot check
  
})


test_that("test that it is possible to read ROI z-stack data file", {
  expect_true(file.exists(file <- system.file("extdata", "nanosims_data", "analysis1", "dat", "12C-z.dat", package = "lans2r")))
  
  # check return values from file
  expect_true(is(data <- lans2r:::read_roi_ion_zstack_data_file(file), "data.frame"))
  
  expect_equal(data %>% nrow(), (data$plane %>% unique() %>% length()) * (data$ROI %>% unique() %>% length()))
  expect_equal(data %>% names(), c("plane", "data_type", "variable", "ROI", "sigma", "value"))
  expect_equal(data$value[5], 877000) # spot check
  expect_equal(data$plane[5], "1") # spot check
  
})


test_that("possible to read all roi data", {
  
  expect_error(read_roi_data("NOFOLDER"), "directory does not exist")
  
  expect_true(file.exists(folder <- system.file("extdata", "nanosims_data", "analysis1", "dat", package = "lans2r")))
  
  expect_message(read_roi_data(folder), ".*read successfully")
  expect_silent(data <- read_roi_data(folder, quiet = T))
  
  # data checks
  expect_equal(data$variable %>% unique(), c("12C", "13C", "14N12C", "15N12C"))
  expect_equal(data %>% nrow(), 444)
  expect_equal(data %>% names(), c("plane", "ROI", "data_type", "variable", "value", "sigma", 
                                   "coord_x", "coord_y", "size", "pixels", "LW_ratio"))
  expect_equal(data$pixels[3], 250) # spot check
  expect_equal(data$plane[3], "all") # spot check
})

test_that("test that it is possible to read full ion data file", {
  expect_true(file.exists(file <- system.file("extdata", "nanosims_data", "analysis1", "mat", "12C.mat", package = "lans2r")))
  
  # check return values from file (names, size, first row)
  expect_true(is(data <- lans2r:::read_full_ion_data_file(file), "data.frame"))
  
  expect_equal(data %>% names(), 
               c("x.px", "y.px", "frame_size.px", "x.um", "y.um", "frame_size.um", 
                 "variable", "data_type", "value", "sigma", "ROI"))
  
  expect_equal(data %>% nrow(), as.integer(256^2))
  #as.integer(data$frame_size.px[1]*data$frame_size.px[1])
  
  expect_equal(data$value[3], 1508) # spot check
  expect_equal(data$variable[3], "12C") # spot check
  expect_equal(data$frame_size.um[3], 10.014) # spot check
  expect_equal(data$data_type[3], "ion_count") # spot check
  
})

test_that("test that it is possible to read all map data in a folder", {
  
  expect_error(read_map_data("NOFOLDER"), "directory does not exist")
  
  expect_true(file.exists(folder <- system.file("extdata", "nanosims_data", "analysis1", "mat", package = "lans2r")))
  
  expect_message(read_map_data(folder), ".*read successfully")
  expect_silent(data <- read_map_data(folder, quiet = T))
  
  # data checks
  expect_equal(data$variable %>% unique(), c("12C", "13C", "14N12C", "15N12C"))
  expect_equal(data %>% nrow(), as.integer(256^2 * 4))
  #as.integer(data$frame_size.px[1] * data$frame_size.px[1] * length(unique(data$variable)))
  expect_equal(data %>% names(), c("x.px", "y.px", "frame_size.px", "x.um", "y.um", "frame_size.um", 
                                   "variable", "data_type", "value", "sigma", "ROI"))
  expect_equal(data$value[nrow(data)], 4) # spot check
  expect_equal(data$variable[nrow(data)], "15N12C") # spot check
  expect_equal(data$frame_size.um[nrow(data)], 10.014) # spot check
  expect_equal(data$data_type[nrow(data)], "ion_count") # spot check
  
})