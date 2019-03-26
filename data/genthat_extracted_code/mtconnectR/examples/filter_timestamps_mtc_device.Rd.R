library(mtconnectR)


### Name: filter_timestamps_mtc_device
### Title: Filter MTCDevice object based on time range
### Aliases: filter_timestamps_mtc_device

### ** Examples

data("example_mtc_device_3")
start_time = as.POSIXct("2016-03-22 12:45:00.000")
end_time = as.POSIXct("2016-03-22 12:45:10.000")
filtered_data = filter_timestamps_mtc_device(example_mtc_device_3,start_time,end_time)



