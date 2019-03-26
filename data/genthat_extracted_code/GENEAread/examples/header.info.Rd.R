library(GENEAread)


### Name: header.info
### Title: Get header info from GENEA output (.bin) file
### Aliases: header.info

### ** Examples


fileheader <- header.info(system.file("binfile/TESTfile.bin",
                                      package = "GENEAread")[1],
                                      more = TRUE)
print(fileheader)
attr(fileheader, "calibration")




