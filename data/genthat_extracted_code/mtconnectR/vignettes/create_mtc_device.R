## ------------------------------------------------------------------------
require(mtconnectR)
file_path_dmtcd = "testdata/dataExtraction/test_dmtcd.log"
file_path_xml = "testdata/dataExtraction/test_devices.xml"
device_name = "test_device"
mtc_device = create_mtc_device_from_dmtcd(
  system.file(file_path_dmtcd, package = "mtconnectR"),
  system.file(file_path_xml, package = "mtconnectR"),
  device_name)


## ------------------------------------------------------------------------
# Get the first data item in the list
mtc_data_item = getDataItem(mtc_device)
print(mtc_data_item)

# Get all the data items with "Xabs" in the name
mtc_data_item = getDataItem(mtc_device, "Xabs")
print(mtc_data_item)

# Get the data item with the 5th index
mtc_data_item = getDataItem(mtc_device, 5)
print(mtc_data_item)

# Get all data items with path matching the string 'POSITION'
mtc_data_item_list = getDataItem(mtc_device, "POSITION")
print(mtc_data_item)

## ------------------------------------------------------------------------

print(summary(mtc_device))
print(summary(mtc_data_item))


## ------------------------------------------------------------------------

# Get Data from a MTC Device Class
mtc_device_data = getData(mtc_device)
print(mtc_device_data)

# Get Data from a MTC Data item Class
mtc_data_item_data = getData(mtc_data_item)
print(mtc_data_item_data)


## ------------------------------------------------------------------------

# merge all the objects that have the string 'POSIT' into one data frame
print(merge(mtc_device, "POSIT"))

# merge data items with indices 3:5 into a data.frame
print(merge(mtc_device, 3:5))

# merge all the data items
merged_mtc_device = (merge(mtc_device))

# renaming column names to make it more readable
names(merged_mtc_device) = stringr::str_replace(names(merged_mtc_device), "test_device<Device>:", "")
print(merged_mtc_device)


