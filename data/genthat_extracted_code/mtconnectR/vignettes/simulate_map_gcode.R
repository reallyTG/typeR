## ------------------------------------------------------------------------
library(mtconnectR)
library(ggplot2)
library(dplyr)

file_path_dmtcd = "extdata/data_truncated.bz2"
file_path_xml   = "extdata/Devices.xml"

# Reading MTC Data
device_name = get_device_info_from_xml(system.file(file_path_xml,package = "mtconnectR"))$name[2]
mtc_device = create_mtc_device_from_dmtcd(system.file(file_path_dmtcd,package = "mtconnectR"),     system.file(file_path_xml,package = "mtconnectR"),device_name)

## ------------------------------------------------------------------------
calc_feed = calculated_feed_from_position(mtc_device) %>%
  mutate(value = replace(value, value < 0.1, 0)) %>% 
  clean_reduntant_rows()

## ------------------------------------------------------------------------
mtc_device = add_data_item_to_mtc_device(mtc_device, calc_feed, category = "SAMPLE",
                                         data_item_name = "pfr_calculated<PATH_FEEDRATE>")

# Using merge with regex pattern to choose only the position variables
pos_data_mtc = merge(mtc_device, "path_pos") %>% filter(timestamp > as.POSIXct("2016-03-22"))
names(pos_data_mtc) = extract_param_from_xpath(names(pos_data_mtc), show_warnings = F)

## ------------------------------------------------------------------------
gcode_file_path = "extdata/raw_gcode.NC"
gcode_parsed = parse_gcode(system.file(gcode_file_path,package = "mtconnectR"))

## ------------------------------------------------------------------------
simulated_gcode_data = simulate_data_from_gcode(gcode_parsed, start_time = 0, data_res = 0.1, data_type = "HH") %>%   na.omit()

# Creating MTCDevice object from the simulated data
mtc_device_sim = create_mtc_device_from_ts(simulated_gcode_data)
pos_data_sim = merge(mtc_device_sim, "pos")

# Plotting variation of Y position with time
ggplot(pos_data_mtc) + geom_path(aes(x = timestamp, y = path_pos_y)) 

## ------------------------------------------------------------------------
time_split_start = as.POSIXct("2016-03-22 12:45:00", tz = "UTC") 
time_split_end = as.POSIXct("2016-03-22 13:00:00", tz = "UTC") 

pos_data_mtc = pos_data_mtc %>% filter(timestamp > time_split_start & timestamp < time_split_end)

## ------------------------------------------------------------------------
# Plotting Y position vs X position to get an idea of the part made
ggplot(pos_data_mtc) + geom_path(aes(x = path_pos_x, y = path_pos_y)) 

# Plotting simulated part as per proper scale
ggplot(pos_data_sim) + geom_path(aes(x = x_pos, y = y_pos)) +
  coord_cartesian(xlim = c(-2.5, 6), ylim = c(-4, 1))

# Plotting actual part as per proper scale
ggplot(pos_data_mtc) + geom_path(aes(x = path_pos_x, y = path_pos_y)) +
  coord_cartesian(xlim = c(-2.5, 6), ylim = c(-4, 1))

## ------------------------------------------------------------------------
time_start_op = as.POSIXct("2016-03-22 12:45:00", tz = "UTC")
time_end_op = as.POSIXct("2016-03-22 13:00:00", tz = "UTC")

mtc_device_op = mtc_device %>% filter_timestamps_mtc_device(time_start_op, time_end_op)
mtc_sim_mapped_op = map_gcode_mtc(mtc_device_sim, mtc_device_op, elasticity = 200)

## ------------------------------------------------------------------------
plot_twoway(mtc_sim_mapped_op, mtc_device_sim, mtc_device_op, 20, 100)

## ------------------------------------------------------------------------
# Comparing feed rate data Simulated vs actual 
feed_compare_op = merge(mtc_sim_mapped_op, "pfr") %>% na.omit()
names(feed_compare_op) = extract_param_from_xpath(names(feed_compare_op), show_warnings = F)

ggplot(feed_compare_op, aes(x = timestamp)) +
  geom_step(aes(y = pfr_calculated, colour = 'Calculated'), size = 1) +
  geom_step(aes(y = pfr, colour = "Simulated"), size = 1) +
  coord_cartesian(ylim = c(-3, 300))

# Comparing feed ratio data Simulated vs actual
pos_feed_ratio_compare_op = merge(mtc_sim_mapped_op, "pfr|_pos_") %>% na.omit()
names(pos_feed_ratio_compare_op) = extract_param_from_xpath(names(pos_feed_ratio_compare_op), show_warnings = F)

pos_feed_ratio_compare_op = pos_feed_ratio_compare_op %>%
  mutate(feed_ratio = abs(round(((pfr_calculated)/(pfr + 1e-6)), 2))) %>%
  mutate(feed_ratio = replace(feed_ratio, feed_ratio > 1.1, NA_real_))

ggplot(pos_feed_ratio_compare_op) +
  geom_path(aes(x = path_pos_x, y = path_pos_y, col = feed_ratio), size = 1) +
  scale_colour_gradient(low="#91bfdb", high = "#fc8d59", na.value = "#ffffbf") +
  coord_cartesian(xlim = c(-2, 5), ylim = c(-4, 1.5))

