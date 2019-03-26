library(bigReg)


### Name: data_frame
### Title: function to create a data_frame object
### Aliases: data_frame

### ** Examples

irisA <- data_frame(iris[1:75,], 10, "irisA", nCores = 1)
irisA$append(iris[76:150,])
irisA$head()
irisA$tail(10)
irisA$delete(); rm(irisA)



