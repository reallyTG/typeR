library(testthat)
library(timelineR)

start_timestamp = as.POSIXct("2017-01-01 00:00:00") 
offsets = c(10, 30, 21, 7, 10, 32)

test_data = data.frame(
  start_time = start_timestamp + offsets,
  state_1 = c("A", "A", "B", "B", "C", "C"),
  # state_2 = c("Ananthu", "Mohsin", "Alex", "Rakesh", "Subbu", "Nitin"),
  state_2 = c("User1", "User1", "User1", "User2", "User2", "User1"),
  num_1 = c(1, 2, 3, 4, 3, 2),
  num_2 = c(200, 250, 529, 1230, 123, 12),
  state_3 = c("employee")) %>% dplyr::arrange(start_time)
str(test_data)

# This function have to be manually tested
context("Testing Plot visualize")
test_that("Default Plotting", {
  plot_timeline(test_data)
  
  # @human - Check the following things
  # titles for the plots are default - num_1, num_2, state_1, state_2
  # times have been assigned correctly with the first tick showing the full time and the rest of the ticks showing the precise one
  # ylimits have been assigned correctly
  # colours have been assigned automatically according to ggplot
})

test_that("Default Plotting", {
  plot_timeline(test_data, add_legend = F)
})

test_that("Different Time ranges", {
  test_data$start_time = start_timestamp + cumsum(sample(1:10, 6, replace = T))
  plot_timeline(test_data)
  # times in seconds
  # 
  #   test_data$start_time = start_timestamp + cumsum(sample(1:100, 6, replace = T))
  #   plot_timeline(test_data)
  #   # times in hours, minutes, seconds
  # 
  #   test_data$start_time = start_timestamp + cumsum(sample(1:1000, 6, replace = T))
  #   plot_timeline(test_data)
  #   # times in hours, minutes
  # 
  #   test_data$start_time = start_timestamp + cumsum(sample(1:1e4, 6, replace = T))
  #   plot_timeline(test_data)
  #   # times in hours, minutes
  # 
  #   test_data$start_time = start_timestamp + cumsum(sample(1:1e5, 6, replace = T))
  #   plot_timeline(test_data)
  #   # times in date hours, minutes
  # 
  #   test_data$start_time = start_timestamp + cumsum(sample(1:1e6, 6, replace = T))
  #   plot_timeline(test_data)
  # Times in days
  expect_true(TRUE)
})

test_that("Fully fledged test case", {

  test_data$start_time = start_timestamp + cumsum(sample(1:10, 6, replace = T))
  
  start_time = "2017-01-01 00:00:00.203" %>% as.POSIXct
  end_time = "2017-01-01 00:01:00.007" %>% as.POSIXct
  save_path = "device.png"
  add_legend = T
  
  ylimits = list("num_2" = c(100, 200)) 
  scale_vals = c("num_1" = 1e2)
  data_cols = c("state" = 1 , "num" = 2) %>% match_grep(names(test_data)) %>% names()
  data_cols = c("state", "num") %>% match_grep(names(test_data), use_values = T, return_names = T)
  titles = c("num_1" = "First Numeric", "num_2" = "Second Numeric", "state_1" = "Last State")
  titles = c(titles, "state_1_num_2" = "First Numeric and Last State")
  ylabels = c("state_1" = "State Label", "num_2" = "Numeric Label")
  plot_size_ratios = c("state_1" = 0.5, "state_2" = 0.5, "state_1_num_2" = 2)
  color_mapping = list("state_1" = c("A" = "green", "B" = "Blue", "C" = "red"))
  overlap_plots_names = list("state_1_num_2" = c("state_1", "num_2"))
  order_plots = c("state_1_num_2", "state_1", "num_1", "state_2", "num_2")
  
  output_grob = plot_timeline(test_data, data_cols, start_time, end_time,
                              ylimits, scale_vals, titles, 
                              ylabels, save_path = save_path, 
                              add_legend, plot_size_ratios,
                              overlap_plots_names = overlap_plots_names, color_mapping = color_mapping, 
                              order_plots = order_plots, plot_output = T)
  
  ## without title for overlapping plot
  titles = c("num_1" = "First Numeric", "num_2" = "Second Numeric", "state_1" = "Last State")
  output_grob = plot_timeline(test_data, data_cols, start_time, end_time,
                              ylimits, scale_vals, titles, 
                              ylabels, save_path = save_path, 
                              add_legend, plot_size_ratios,
                              overlap_plots_names = overlap_plots_names, color_mapping = color_mapping, 
                              order_plots = order_plots, plot_output = T)
  expect_true(TRUE)
})

context("wrong color mapping")
test_that("Case 1: not all states have defined mapping",{
  color_mapping = list("state_1" = c("A" = "green", "B" = "Blue"))
  expect_error(plot_timeline(timeline_df = test_data, color_mapping = color_mapping))

  color_mapping = list("state_1" = c("A" = "green", "B" = "Blue", "C" = "Red", "D" = "Yellow"))
  expect_error(plot_timeline(timeline_df = test_data, color_mapping = color_mapping))
})

test_that("Case 2: undefined states have mapping",{
  color_mapping = list("state_1" = c("A" = "green", "B" = "Blue", "D" = "Red"))
  expect_error(plot_timeline(timeline_df = test_data, color_mapping = color_mapping))
})
