library(biclust)


### Name: bubbleplot
### Title: Bubbleplot
### Aliases: bubbleplot 'bubble plot' 'star graph'
### Keywords: hplot cluster

### ** Examples

  
  #Simplified yeast microarray data
  ## Not run: 
##D  
##D   data(BicatYeast)
##D   set.seed(1)
##D   bics1 <- biclust(BicatYeast,BCPlaid(), back.fit = 2, shuffle = 3, fit.model = ~m + a + b,
##D   row.release = 0.7, col.release = 0.7,
##D   verbose = FALSE, max.layers = 10, iter.startup = 5,
##D   iter.layer = 30)
##D   bubbleplot(BicatYeast,bics1, showLabels=TRUE)
##D 
##D   loma=binarize(BicatYeast,2)
##D   bics2=biclust(loma,BCBimax(), minr=4, minc=4, number=10)
##D   bubbleplot(BicatYeast,bics1,bics2)
##D   
## End(Not run)
  


