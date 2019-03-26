library(mtconnectR)


### Name: extract_param_from_xpath
### Title: Extract different parts of a xpath
### Aliases: extract_param_from_xpath

### ** Examples


xpaths = c("timestamp",
 "nist_testbed_Mazak_QT_1<Device>:avail<AVAILABILITY>",
 "nist_testbed_Mazak_QT_1<Device>:execution<EXECUTION>",
 "nist_testbed_Mazak_QT_1<Device>:Fovr<x:PATH_FEEDRATE-OVERRIDE>")

extract_param_from_xpath(xpaths, "DIName")
extract_param_from_xpath(xpaths, "DIType")
extract_param_from_xpath(xpaths, "DIType", TRUE)
extract_param_from_xpath(xpaths, "Device")




