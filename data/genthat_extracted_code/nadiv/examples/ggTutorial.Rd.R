library(nadiv)


### Name: ggTutorial
### Title: Simulated dataset used to analyze data with genetic group animal
###   models
### Aliases: ggTutorial
### Keywords: datasets

### ** Examples


 ## Not run: 
##D   rm(list = ls())
##D   set.seed(102)     #<-- seed value used originally
##D   library(nadiv)
##D   # create data using `simGG()`
##D   ggTutorial <- simGG(K = 400, pairs = 200, noff = 4, g = 15,
##D     nimm = 40, nimmG = seq(2, g-1, 1),		    # nimmG default value
##D     VAf = 1, VAi = 1, VRf = 1, VRi = 1,		    # all default values
##D     mup = 20, muf = 0, mui = 3, murf = 0, muri = 0, # mup and mui non-default values
##D     d_bvf = 0, d_bvi = 0, d_rf = 0, d_ri = 0)	    # all default values
##D  
## End(Not run)




