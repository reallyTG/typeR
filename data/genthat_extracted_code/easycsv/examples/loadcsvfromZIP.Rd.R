library(easycsv)


### Name: loadcsvfromZIP
### Title: read multiple csv files into named data frames
### Aliases: loadcsvfromZIP
### Keywords: ~utilities ~misc

### ** Examples

  require(easycsv)
  filezip <- system.file("exampleZips", "example_tables.zip", package="easycsv")
  loadcsvfromZIP(filezip)
  loadcsvfromZIP(filezip, txt = TRUE)



