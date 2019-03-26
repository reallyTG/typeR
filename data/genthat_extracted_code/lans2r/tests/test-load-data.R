context("Load data")

test_that("test that proper errors are thrown in data loading", {
  
  # error and file checks
  expect_error(load_LANS_summary("NOFOLDER"), "directory does not exist")
  expect_error(load_LANS_maps("NOFOLDER"), "directory does not exist")
  expect_true(file.exists(folder <- system.file("extdata", "nanosims_data", package = "lans2r")))
  expect_true(file.exists(folder <- system.file("extdata", "nanosims_data", "analysis1", package = "lans2r")))
  expect_true(file.exists(folder <- system.file("extdata", "nanosims_data", "analysis2", package = "lans2r")))
  expect_true(file.exists(folder <- system.file("extdata", "nanosims_data", "analysis3", package = "lans2r")))
  
})

test_that("test that it is possible to load multiple LANS summaries", {
  
  expect_true(file.exists(folder <- system.file("extdata", "nanosims_data", package = "lans2r")))
  
  # regular load
  expect_message(
    load_LANS_summary (analysis = c("analysis1", "analysis2", "analysis3"), 
                       base_dir = folder, load_zstacks = FALSE), 
    ".*read successfully.*Z-stacks were not loaded")
  expect_silent(
    data <- load_LANS_summary (analysis = c("analysis1", "analysis2", "analysis3"), 
                               base_dir = folder, load_zstacks = FALSE, quiet = T))
  
  # data checks
  expect_equal(data$variable %>% unique(), c("12C", "13C", "14N12C", "15N12C"))
  expect_equal(data$plane %>% unique(), "all")
  expect_equal(data$analysis %>% unique(), c("analysis1", "analysis2", "analysis3"))
  expect_equal(data %>% names(), c("analysis", "plane", "ROI", "data_type", "variable", "value", 
                                   "sigma", "coord_x", "coord_y", "size", "pixels", "LW_ratio"))
  expect_equal(data %>% {.[1,]} %>% as.character(), 
               c("analysis1", "all", "1", "ion_count", "12C", "1895850", "1376.89868908355", 
                 "17.38", "192.93", "0.83", "353", "2.45"))
  
  # z-stack load
  expect_message(
    load_LANS_summary (analysis = c("analysis1", "analysis2", "analysis3"), 
                       base_dir = folder, load_zstacks = TRUE), 
    ".*read successfully.*Z-stacks were loaded")
  expect_silent(
    data <- load_LANS_summary (analysis = c("analysis1", "analysis2", "analysis3"), 
                               base_dir = folder, load_zstacks = TRUE, quiet = T))
  
  # data checks
  expect_equal(data$variable %>% unique(), c("12C", "13C", "14N12C", "15N12C"))
  expect_equal(data$plane %>% unique(), c("all", "1", "2"))
  expect_equal(data$analysis %>% unique(), c("analysis1", "analysis2", "analysis3"))
  expect_equal(data %>% names(), c("analysis", "plane", "ROI", "data_type", "variable", "value", 
                                   "sigma", "coord_x", "coord_y", "size", "pixels", "LW_ratio"))
  expect_equal(data %>% {.[1,]} %>% as.character(), 
               c("analysis1", "all", "1", "ion_count", "12C", "1895850", "1376.89868908355", 
                 "17.38", "192.93", "0.83", "353", "2.45"))
  
  # additional information
  expect_silent(
    data <- load_LANS_summary (analysis = c("analysis1", "analysis2", "analysis3"), 
                               information = c("run1", "run2", "run3"),
                               date = as.Date(c("2015-01-01", "2016-02-25", "2017-03-04")),
                               base_dir = folder, load_zstacks = FALSE, quiet = T))
  
  expect_equal(
    data %>% select(analysis, information, date) %>% unique(),
    structure(
      list(analysis = c("analysis1", "analysis2", "analysis3"), 
           information = c("run1", "run2", "run3"), 
           date = structure(c(16436, 16856, 17229), class = "Date")), 
      .Names = c("analysis", "information", "date"), 
      row.names = c(NA, -3L), 
      class = c("tbl_df", "tbl", "data.frame"))
  )
  
})

test_that("test that it is possible to load LANS maps", {
  
  expect_true(file.exists(folder <- system.file("extdata", "nanosims_data", package = "lans2r")))
  
  expect_silent(maps <- load_LANS_maps (analysis = c("analysis1", "analysis2", "analysis3"), 
                                        base_dir = folder, quiet = T))
  
  # check data
  expect_equal(nrow(maps), as.integer(256^2 * 4 * 3)) 
  # pixels <- maps %>% select(analysis, frame_size.px, variable) %>% unique() %>% 
  #   group_by(analysis) %>% summarize(n = unique(frame_size.px)^2 * length(variable))
  # as.integer(sum(pixels$n))
  
  expect_equal(maps$variable %>% unique(), c("12C", "13C", "14N12C", "15N12C"))
  expect_equal(maps %>% names(), 
               c("analysis", "x.px", "y.px", "frame_size.px", "x.um", "y.um", 
                 "frame_size.um", "variable", "data_type", "value", "sigma", "ROI"))
  expect_equal(maps$value[5], 1136) # spot check
  
  
})