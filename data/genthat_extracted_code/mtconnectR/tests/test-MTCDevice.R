
library("testthat")
library('plyr')
library('dplyr')

data("example_mtc_device")

#===============================================================================
context("create_mtc_device_from_ts")
merged_device = merge(example_mtc_device)
mtc_device_unmerged = create_mtc_device_from_ts(merged_device)
mtc_device_remerged = merge(mtc_device_unmerged)
expect_equal(merged_device, mtc_device_remerged)

#===============================================================================
context("calculated_feed_from_position")
data("example_mtc_device_3")
calculated_feed = calculated_feed_from_position(example_mtc_device_3)
expected_feed = data.frame(timestamp = as.POSIXct(c("2016-03-22 12:45:00.286561",
                                                    "2016-03-22 12:45:59.258526"), tz = 'UTC'),
                           value = c(0,0.05264092964))
expect_equal(calculated_feed,expected_feed)

#===============================================================================
context("filter_timestamps_mtc_device")
data("example_mtc_device_3")

start_time = as.POSIXct("2016-03-22 12:45:00.000", tz = "UTC")
end_time = as.POSIXct("2016-03-22 12:45:00.500", tz = "UTC")
filtered_data = filter_timestamps_mtc_device(example_mtc_device_3,start_time,end_time)
filtered_data <- merge(filtered_data,"path_pos")
names(filtered_data) = extract_param_from_xpath(names(filtered_data),show_warnings = F)

expected_data = data.frame(timestamp = as.POSIXct(c("2016-03-22 12:45:00.134638",
                                                    "2016-03-22 12:45:00.286561"), tz = 'UTC'),
                           path_pos_x = c(17.86212,17.86213),
                           path_pos_y = c(-21.07304,-21.07304),
                           path_pos_z = c(9.68194,9.68194))

expect_equal(filtered_data,expected_data)

