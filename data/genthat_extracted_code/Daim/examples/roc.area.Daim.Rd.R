library(Daim)


### Name: roc.area
### Title: Plot the area under the ROC curve
### Aliases: roc.area roc.area.Daim roc.area.Daim.list roc.area.Daim.vector
### Keywords: hplot classif

### ** Examples


  data(Daim.data1)
  data(Daim.data2)


  perform1 <- performDaim(Daim.data1$prob.oob, Daim.data1$labels, 
                          Daim.data1$prob.app)
  perform2 <- performDaim(Daim.data2$prob.oob, Daim.data2$labels, 
                          Daim.data2$prob.app)
  
  summary(perform1)
  summary(perform2)

  roc.area(perform2)
  roc.area(perform1, area.color=rgb(0,0,1,alpha=0.2), col="blue", add=TRUE)
  legend(0.7, 0.2, c("Model-1","Model-2"), col=c("red","blue"), lty=1, bg="white")

  
  ## Not run: 
##D   
##D   ## just because of checking time on CRAN
##D   
##D   
##D   ####
##D   #### If your device don't support the semi-transparent colors use 
##D   #### the PDF Graphics Device.
##D   ####
##D 
##D   pdf("ROC-area.pdf")
##D 
##D   roc.area(perform2)
##D   roc.area(perform1, area.color=rgb(0,0,1,alpha=0.2), col="blue", add=TRUE)
##D   legend(0.7, 0.2, c("Model 1","Model 2"), col=c("red","blue"), lty=1, bg="white")
##D   dev.off()
##D   
## End(Not run)



