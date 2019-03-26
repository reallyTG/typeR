library(mtconnectR)


### Name: add_data_item_to_mtc_device
### Title: Add a new data item to an existing MTC Device Class
### Aliases: add_data_item_to_mtc_device

### ** Examples

data_item_data = data.frame(timestamp = as.POSIXct(c(0.5, 1, 1.008, 1.011) +
                                        1445579573,  tz = 'CST6CDT', origin = "1970-01-01"),
                            value = c("a", "b", "c", "d"))
data("example_mtc_device")
mtc_device_updated =
   add_data_item_to_mtc_device(example_mtc_device, data_item_data,
    data_item_name = "test", category = "EVENT")
print(mtc_device_updated)



