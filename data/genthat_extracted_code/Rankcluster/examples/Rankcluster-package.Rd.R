library(Rankcluster)


### Name: Rankcluster-package
### Title: Model-Based Clustering for Multivariate Partial Ranking Data
### Aliases: Rankcluster Rankcluster-package Rankcluster-package,
### Keywords: package

### ** Examples

#see vignette
#vignette("Rankcluster")

#main function of the package for run the algorithm
data(big4)
result=rankclust(big4$data,K=2,m=big4$m,Ql=200,Bl=100,maxTry=2)
 



