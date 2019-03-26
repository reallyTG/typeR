library(mtconnectR)


### Name: parse_devicexml_for_a_device
### Title: Parse XML file for given device name
### Aliases: parse_devicexml_for_a_device

### ** Examples

file_path_xml   = "testdata/dataExtraction/test_devices.xml"
device_name = "test_device"
parsed_device_xml = parse_devicexml_for_a_device(system.file(file_path_xml,
                                                package = "mtconnectR"),device_name)



