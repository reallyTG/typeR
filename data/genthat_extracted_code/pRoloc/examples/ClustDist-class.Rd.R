library(pRoloc)


### Name: ClustDist-class
### Title: Class '"ClustDist"'
### Aliases: ClustDist class:ClustDist ClustDist-class
###   plot,ClustDist,MSnSet-method show,ClustDist-method
### Keywords: classes

### ** Examples

  showClass("ClustDist")
  
  library('pRolocdata')
  data(dunkley2006)
  par <- setAnnotationParams(inputs =
                    c("Arabidopsis thaliana genes",
                      "Gene stable ID"))
                    
  ## add protein set/annotation information                  
  xx <- addGoAnnotations(dunkley2006, par)
  
  ## filter
  xx <- filterMinMarkers(xx, n = 50)
  xx <- filterMaxMarkers(xx, p = .25)
  
  ## get distances for protein sets
  dd <- clustDist(xx)
  
  ## plot clusters for first 'ClustDist' object 
  ## in the 'ClustDistList'
  plot(dd[[1]], xx)
  
  ## plot distances for all protein sets 
  plot(dd)



