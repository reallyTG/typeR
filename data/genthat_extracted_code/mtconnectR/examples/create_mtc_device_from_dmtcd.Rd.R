library(mtconnectR)


### Name: create_mtc_device_from_dmtcd
### Title: Create MTCDevice class from Delimited MTC Data and log file
### Aliases: create_mtc_device_from_dmtcd

### ** Examples

file_path_dmtcd = "testdata/dataExtraction/test_dmtcd.log"
file_path_xml = "testdata/dataExtraction/test_devices.xml"
device_name = "test_device"
mtc_device = create_mtc_device_from_dmtcd(
  system.file(file_path_dmtcd, package = "mtconnectR"),
  system.file(file_path_xml, package = "mtconnectR"),
  device_name)
print(summary(mtc_device))



