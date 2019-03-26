library(r.jive)


### Name: r.jive-package
### Title: Perform JIVE Decompositions for Multi-Source Data
### Aliases: r.jive-package r.jive
### Keywords: package

### ** Examples

## Not run: 
##D set.seed(10)
##D ##Load data that were simulated as in Section 2.4 of Lock et al., 2013,
##D ##with rank 1 joint structure, and rank 1 individual structure for each dataset
##D data(SimData) 
##D # Using default method ("perm")
##D Results <- jive(SimData)
##D summary(Results)
##D 
##D # Using BIC rank selection
##D BIC_result <- jive(SimData, method="bic")
##D summary(BIC_result)
## End(Not run)
###Load the permutation results
data(SimResults) 
# Visualize results
showVarExplained(Results)
# showVarExplained is also called by the "jive" S3 class default plot method

#show heatmaps
showHeatmaps(Results)

#show PCA plots
showPCA(Results,1,c(1,1))




