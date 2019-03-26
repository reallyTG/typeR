library('testthat')

file_path_xml = "testdata/dataExtraction/test_devices.xml"

#===============================================================================
context("get_xpaths_from_xml")

device_name = "test_device"
xpath_info = get_xpaths_from_xml(system.file(file_path_xml, package = "mtconnectR"), device_name)
xpath_info = xpath_info[1,]
expected_xpaths = data.frame(id = "X_6467", name = "Xabs", type = "POSITION", 
                             category = "SAMPLE", subType = "ACTUAL",
                             xpath = "test_device<Device>:Xabs<POSITION-ACTUAL>")
device_details = c("test_device", "test_device_uuid", "id_1234")
names(device_details) = c("name", "uuid", "id")
attr(expected_xpaths,"details") = device_details
expect_equal(xpath_info,expected_xpaths)

#===============================================================================
context("get_xpaths_from_xml")
devices_info = get_device_info_from_xml(system.file(file_path_xml, package = "mtconnectR"))
expected_devices_info = data.frame(name = c("test_device", "test_device_2"),
                                   uuid = c("test_device_uuid", "test_device_2_uuid"),
                                   id = c("id_1234","id_5678"))
expect_equal(devices_info,expected_devices_info)

#===============================================================================
context("parse_devicexml_for_a_device")
data("example_parsed_device_xml")
device_name = "test_device"
parsed_xml_for_device = parse_devicexml_for_a_device(system.file(file_path_xml, 
                                                      package = "mtconnectR"),device_name)
expect_equal(parsed_xml_for_device,example_parsed_device_xml)
