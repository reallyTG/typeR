library(SyNet)


### Name: nam
### Title: Sympatry Network Analysis
### Aliases: nam
### Keywords: methods iteration

### ** Examples

  data(sciobius2x2)
  mtx <- gridinfer(dntable = sciobius2x2, reciprocity = FALSE) # Infers the sympatry network 
  cleavosciobius <- nam(mtx) # Performs NAM analysis and create cleavogram called 'cleavosciobius'
  ## Not run: 
##D   cleavogram()
##D   
## End(Not run)
  # Choose the previous cleavogram and dissect it! 



