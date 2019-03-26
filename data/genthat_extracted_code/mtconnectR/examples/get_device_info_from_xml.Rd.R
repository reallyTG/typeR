library(mtconnectR)


### Name: get_device_info_from_xml
### Title: Get info on all the devices in the xml file
### Aliases: get_device_info_from_xml

### ** Examples

file_path_xml = "testdata/dataExtraction/test_devices.xml"
devices_info = get_device_info_from_xml(system.file(file_path_xml, package = "mtconnectR"))
print(devices_info)




