library(SIRItoGTFS)


### Name: readGTFS
### Title: read GTFS files from a folder into R's environment
### Aliases: readGTFS
### Keywords: iteration utilities

### ** Examples

  require(SIRItoGTFS)
  directory = getwd()
  write.csv(data.frame(matrix(1:9, nrow = 3)), file = file.path(directory,"/agency.csv"))
  write.csv(data.frame(matrix(1:9, nrow = 3)), file = file.path(directory,"/calendar.csv"))
  write.csv(data.frame(matrix(1:9, nrow = 3)), file = file.path(directory,"/routes.txt"))
  write.csv(data.frame(matrix(1:9, nrow = 3)), file = file.path(directory,"/shapes.txt"))
  write.csv(data.frame(matrix(1:9, nrow = 3)), file = file.path(directory,"/stop_times.txt"))
  write.csv(data.frame(matrix(1:9, nrow = 3)), file = file.path(directory,"/stops.txt"))
  write.csv(data.frame(matrix(1:9, nrow = 3)), file = file.path(directory,"/translations.txt"))
  write.csv(data.frame(matrix(1:9, nrow = 3)), file = file.path(directory,"/trips.txt"))

  # now we read just the minimal tables needed for `STG`,
  # meaning everything besides shapes and translations
  readGTFS(directory, minimal = TRUE, extension = "BOTH")




