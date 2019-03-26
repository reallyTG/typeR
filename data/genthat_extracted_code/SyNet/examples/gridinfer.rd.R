library(SyNet)


### Name: gridinfer
### Title: Sympatry Inference from Grids
### Aliases: gridinfer
### Keywords: methods

### ** Examples

  data(sciobius2x2)
  #Do inference and discount reciprocity. 
  ######
  aux1 <- gridinfer(dntable = sciobius2x2, reciprocity = FALSE)$sm # Displays the sympatry matrix  
  #Check that the widespread S. pullus (pu) has here many neighbors because distributions
  #are nested inside it. In a network analysis this kind of element will behave as intermediary node.  
  aux1["pu",] #There are many connections to S. pullus coded 1. 
  ######
  #Do inference and force to consider reciprocity in the pairwise comparisons of species ranges. 
  #That is, study now co-extensive sympatry. 
  aux2 <- gridinfer(dntable = sciobius2x2, reciprocity = TRUE)$sm # Displays the sympatry matrix  
  #S. pullus is now an isolated node because there is no other taxa that spreads over the 
  #surface like S. pullus. 
  aux2["pu",] #Only the loop is present in this vector of connections for S. pullus.  



