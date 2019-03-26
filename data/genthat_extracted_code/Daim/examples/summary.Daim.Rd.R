library(Daim)


### Name: summary.Daim
### Title: Summarizing a Daim Object
### Aliases: summary.Daim summary.Daim.vector summary.Daim.list
### Keywords: manip

### ** Examples

  library(Daim)
  data(Daim.data1)
  perform <- performDaim(Daim.data1$prob.oob, 
                         Daim.data1$labels, Daim.data1$prob.app)
  perform
  summary(perform)

  data(Daim.data3)
  head(Daim.data3)

  M <- roc(Daim.data3[,2], Daim.data3[,1], labpos="pos")
  summary(M)

  M <- roc(Daim.data3[,-1], Daim.data3[,1], labpos="pos")
  summary(M)




