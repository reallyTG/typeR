library(ecespa)


### Name: getis
### Title: Neighbourhood density function
### Aliases: getis plot.ecespa.getis print.ecespa.getis
### Keywords: spatial

### ** Examples


  ## Compare with fig. 5b of Getis & Franklin (1987: 476):
  
  data(ponderosa)
  
  #ponderosa12 <- getis(ponderosa, nx = 30, ny = 30, R = 12)
  ponderosa12 <- getis(ponderosa, nx = 20, ny = 20, R = 12)
  
  plot(ponderosa12, type = "l", dimyx=256)
  
## Not run: 
##D   ## Plot the same, using Smooth.ppp in spatstat
##D   
##D   ponderosa.12 <- setmarks(ponderosa, ponderosa12$klocal)
##D   
##D   Z <- Smooth(ponderosa.12, sigma=5, dimyx=256)
##D   
##D   plot(Z, col=topo.colors(128), main="smoothed neighbourhood density")
##D   
##D   contour(Z, add=TRUE)
##D   
##D   points(ponderosa, pch=16, cex=0.5) 
##D   
##D 
##D   ## Example with irregular window:
##D   
##D   data(letterR)
##D   
##D   X <- rpoispp(50, win=letterR)
##D   
##D   X.g <- getis(X, R=0.2)
##D   
##D   plot(X.g,dimyx=c(200,100))
##D   
##D    ## Plot the same, using Smooth.ppp in spatstat
##D     X2 <- setmarks(X, X.g$klocal)
##D   
##D     Z <- Smooth(X2, sigma=0.05, dimxy=256)
##D   
##D     plot(Z, col=topo.colors(128), main="smoothed neighbourhood density")
##D   
##D     contour(Z, add=TRUE)
##D   
##D     points(X, pch=16, cex=0.5)
##D   
##D     
##D     
## End(Not run)



