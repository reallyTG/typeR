library(easycsv)


### Name: loadcsv_multi
### Title: read multiple csv files into named data frames
### Aliases: loadcsv_multi
### Keywords: ~utilities ~misc

### ** Examples

  require(easycsv)
  directory = getwd()
  table1 <- data.frame(matrix(1:9, nrow = 3))
  write.csv(table1, file = file.path(directory,"/table1.csv"))
  write.csv(table1, file = file.path(directory,"/table2.txt"))
  loadcsv_multi(directory, extension = "BOTH")



