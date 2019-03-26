library(mclust)


### Name: plot.clustCombi
### Title: Plot Combined Clusterings Results
### Aliases: plot.clustCombi
### Keywords: cluster

### ** Examples

## Not run: 
##D data(Baudry_etal_2010_JCGS_examples)
##D 
##D ## 1D Example 
##D output <- clustCombi(Test1D, G=1:15)
##D 
##D # plots the hierarchy of combined solutions, then some "entropy plots" which 
##D # may help one to select the number of classes (please see the article cited 
##D # in the references)
##D plot(output) 
##D 
##D ## 2D Example 
##D output <- clustCombi(ex4.1) 
##D 
##D # plots the hierarchy of combined solutions, then some "entropy plots" which 
##D # may help one to select the number of classes (please see the article cited 
##D # in the references)
##D plot(output) 
##D 
##D ## 3D Example 
##D output <- clustCombi(ex4.4.2)
##D 
##D # plots the hierarchy of combined solutions, then some "entropy plots" which 
##D # may help one to select the number of classes (please see the article cited 
##D # in the references)
##D plot(output)
## End(Not run)




