library(Daim)


### Name: plot.roc.Daim
### Title: Plotting method for roc.Daim Objects
### Aliases: plot.Daim.vector plot.Daim.list
### Keywords: hplot classif

### ** Examples

  library(Daim)
  data(Daim.data3)

  M <- roc(Daim.data3[,2], Daim.data3[,1], "pos")
  plot(M)

  M <- roc(Daim.data3[,-1], Daim.data3[,1], "pos")
  plot(M, color=1:4)

  M <- roc(Daim.data3[,-1], Daim.data3[,1], "pos")
  plot(M, color="black", lty=1:4)



