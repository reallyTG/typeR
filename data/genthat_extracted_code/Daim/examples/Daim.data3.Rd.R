library(Daim)


### Name: Daim.data 3
### Title: Data set: Artificial data for use with Daim
### Aliases: Daim.data3
### Keywords: datasets

### ** Examples

  data(Daim.data3)
  head(Daim.data3)
  M <- roc(Daim.data3[,-1], Daim.data3[,1], labpos="pos")
  summary(M)



