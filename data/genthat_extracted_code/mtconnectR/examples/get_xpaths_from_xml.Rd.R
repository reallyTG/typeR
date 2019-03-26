library(mtconnectR)


### Name: get_xpaths_from_xml
### Title: Get XML xpath info
### Aliases: get_xpaths_from_xml

### ** Examples

file_path_xml = "testdata/dataExtraction/test_devices.xml"
device_name = "test_device"
xpath_info = get_xpaths_from_xml(system.file(file_path_xml, package = "mtconnectR"), device_name)
print(xpath_info)



