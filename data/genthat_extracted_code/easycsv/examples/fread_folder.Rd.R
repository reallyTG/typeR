library(easycsv)


### Name: fread_folder
### Title: read multiple csv files into named data frames
### Aliases: fread_folder
### Keywords: ~utilities ~misc

### ** Examples

  require(easycsv)
  require("data.table")
  directory = getwd()
  write.csv(data.frame(matrix(1:9, nrow = 3)), file = file.path(directory,"/table1.csv"))
  write.csv(data.frame(matrix(1:9, nrow = 3)), file = file.path(directory,"/table2.csv"))
  write.csv(data.frame(matrix(1:9, nrow = 3)), file = file.path(directory,"/table3.txt"))
  write.csv(data.frame(matrix(1:9, nrow = 3)), file = file.path(directory,"/table4.txt"))
  fread_folder(directory, extension = "BOTH")



