library(RConics)


### Name: splitDegenerateConic
### Title: Split degenerate conic
### Aliases: splitDegenerateConic

### ** Examples

  # tw0 lines
  g <- c(0.75,0.25,3)
  h <- c(0.5,-0.25,2)
 
  # a degenerate conic 
  D <- g %*% t(h) + h %*% t(g)
  
  # split the degenerate conic into 2 lines
  L <- splitDegenerateConic(D)
  
  # plot
  plot(0,0,xlim=c(-10,5),ylim=c(-10,10),type="n")
  addLine(L[,1],col="red")
  addLine(L[,2],col="green")



