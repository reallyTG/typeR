library(pRoloc)


### Name: ClustDistList-class
### Title: Storing multiple ClustDist instances
### Aliases: ClustDistList class:ClustDistList ClustDistList-class
###   plot,ClustDistList,missing-method show,ClustDistList-method
###   [,ClustDistList,ANY,ANY,ANY-method
###   [,ClustDistList,ANY,missing,missing-method
###   [[,ClustDistList,ANY,ANY-method [[,ClustDistList,ANY,missing-method
###   length,ClustDistList-method names,ClustDistList-method
###   names<-,ClustDistList,ANY-method lapply,ClustDistList-method
###   sapply,ClustDistList-method
### Keywords: classes

### ** Examples

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
  
  ## plot distances for all protein sets 
  plot(dd)
  
  names(dd)
  
  ## Extract first 4 ClustDist objects of the ClustDistList
  dd[1:4]
  
  ## Extract 1st ClustDist object
  dd[[1]]



