library(documair)


### Name: dpert
### Title: The (Modified) PERT Distribution
### Aliases: dpert ppert qpert rpert
### Keywords: distribution

### ** Examples
 
  curve(dpert(x,min=3,mode=5,max=10,shape=6), from = 2, to = 11, lty=3) 
  curve(dpert(x,min=3,mode=5,max=10), from = 2, to = 11, add=TRUE) 
  curve(dpert(x,min=3,mode=5,max=10,shape=2), from = 2, to = 11, add=TRUE,lty=2) 
  legend(x = 8, y = 2, c("Default","shape:2","shape:6"), lty=1:3) 



