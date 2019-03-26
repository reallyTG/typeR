library(mlegp)


### Name: mlegp-svd-functions
### Title: Singular Value Decomposition functions for mlegp
### Aliases: mlegp-svd-functions pcweights getSingularValues
###   numSingularValues singularValueImportance
### Keywords: internal ts multivariate

### ** Examples



## create functional output that varies based on parameter 'p' ##
x = seq(-5,5,by=.2)
p = 1:50
y = matrix(0,length(p), length(x))
for (i in p) {
	y[i,] = sin(x) + i + rnorm(length(x), sd  = .1)
}

singularValueImportance(t(y))
numSingularValues(t(y), cutoff = 99.99)




