library(Daim)


### Name: plot.Daim
### Title: Plotting method for Daim Objects
### Aliases: plot.Daim
### Keywords: hplot classif

### ** Examples

  library(Daim)
  data(Daim.data1)
  perform <- performDaim(Daim.data1$prob.oob, Daim.data1$labels, Daim.data1$prob.app)
  summary(perform)

  par(mfrow=c(2,2))
  plot(perform, method="0.632+", legend=TRUE)
  plot(perform, method="sample")
  plot(perform, method="0.632+", main="Comparison between methods")
  plot(perform, method="0.632", col="blue", add=TRUE)
  plot(perform, method="loob", col="green", add=TRUE)
  legend("bottomright", c("0.632+","0.632","loob"),
         col=c("red","blue","green"), lty=1, inset=0.01)
  plot(perform, all.roc=TRUE)


  ####
  #### If your device don't support the semi-transparent colors use 
  #### the PDF Graphics Device.
  ####
   
  ## Not run: 
##D   pdf("plot-Daim.pdf")
##D   plot(perform, method="0.632+")
##D   plot(perform, method="sample")
##D   plot(perform, method="0.632+", main="Comparison between methods")
##D   plot(perform, method="0.632", col="blue", add=TRUE)
##D   plot(perform, method="loob", col="green", add=TRUE)
##D   legend("bottomright", c("0.632+","0.632","loob"),
##D          col=c("red","blue","green"), lty=1, inset=0.01)
##D   plot(perform, all.roc=TRUE)
##D   dev.off()
##D   
## End(Not run)  



