library(RmixmodCombi)


### Name: mixmodCombi
### Title: Combining Mixture Components for Clustering
### Aliases: mixmodCombi
### Keywords: cluster

### ** Examples


##### Example of quantitative data #####

set.seed(1)

data(Baudry_etal_2010_JCGS_examples)
res <- mixmodCombi(ex4.1, nbCluster = 1:8)

res # is of class MixmodCombi

res@mixmodOutput # is the initial EM/BIC solution (provided by mixmodCluster or by the user as a
# [\code{\linkS4class{MixmodCluster}}] object) from which the hierarchy is computed

res@hierarchy[[3]] # is the 3-cluster solution obtained by hierarchically combining the initial
# EM/BIC solution

## Not run: 
##D plot(res)
##D 
##D hist(res, nbCluster = 4)
## End(Not run)

##### Example of qualtitative data #####

set.seed(1)

data(car)
res <- mixmodCombi(car[1:300,], nbCluster = 1:10) # Only the 300 first observations for a 
# quick example

res # is of class MixmodCombi

res@mixmodOutput # is the initial EM/BIC solution (provided by mixmodCluster or by the user as a 
# [\code{\linkS4class{MixmodCluster}}] object) from which the hierarchy is computed

res@hierarchy[[res@ICLNbCluster]] # is the solution obtained by hierarchically combining the initial
# EM/BIC solution for the number of clusters selected with ICL

## Not run: 
##D plot(res)
##D 
##D barplot(res)
## End(Not run)




