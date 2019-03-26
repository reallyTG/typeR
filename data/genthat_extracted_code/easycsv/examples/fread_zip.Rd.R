library(easycsv)


### Name: fread_zip
### Title: read multiple csv files into named data frames
### Aliases: fread_zip
### Keywords: ~utilities ~misc

### ** Examples


  require(easycsv)
  filezip <- system.file("exampleZips", "example_tables.zip", package="easycsv")
  fread_zip(filezip)
  fread_zip(filezip, extension = "CSV")



