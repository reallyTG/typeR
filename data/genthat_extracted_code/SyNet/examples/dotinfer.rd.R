library(SyNet)


### Name: dotinfer
### Title: Inference of a Sympatry Network from Point Data
### Aliases: dotinfer
### Keywords: methods

### ** Examples

  data(mayflynz)
  aux <- procdnpoint(mayflynz) #Pre-processing of data
  toponz <- toposimilar(aux) #Similarity matrix. 
  acshnz <- acsh(aux) #Dissimilarity matrix. 
  rewnz <- reweight(toponz) #Similarity matrix. 
  #Explore the content of previous matrices in addition to the distributions
  #of involved species. 
  ## Not run: 
##D   dotinfer(aux, list(toponz = toponz, acshnz = acshnz, rewnz = rewnz))
##D   
## End(Not run) 



