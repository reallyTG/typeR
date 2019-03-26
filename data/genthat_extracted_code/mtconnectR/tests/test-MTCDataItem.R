
library("testthat")
library('plyr')
library('dplyr')

data("example_mtc_data_item")

#===============================================================================
context("getData - MTCDataItem")
data_item_data = getData(example_mtc_data_item)
expected_data_item_data = data.frame(example_mtc_data_item@data)
expect_equal(data_item_data, expected_data_item_data)

#===============================================================================
context("MTCDataItem - getMetaData")
actual_output = getMetaData(example_mtc_data_item)
expected_output = list(category = "SAMPLE", xpath = "test_device<Device>:Xabs<POSITION-ACTUAL>")
expect_equal(actual_output, expected_output)

