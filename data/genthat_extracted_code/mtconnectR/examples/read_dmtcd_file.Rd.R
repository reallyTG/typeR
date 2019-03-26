library(mtconnectR)


### Name: read_dmtcd_file
### Title: Function to load Log data into R as a data.frame
### Aliases: read_dmtcd_file

### ** Examples

device_name = "test_device"
file_path_xml = "testdata/dataExtraction/test_devices.xml"
xpath_info = get_xpaths_from_xml(system.file(file_path_xml, package = "mtconnectR"), device_name)



