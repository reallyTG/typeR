library(kmlcov)


### Name: kmlCov
### Title: Clustering longitudinal data from different starting conditions
### Aliases: kmlCov

### ** Examples

data(artifdata)
res <- kmlCov(formula = Y ~ clust(time + time2), data = artifdata, ident = 'id',
timeVar = 'time', effectVar = 'treatment', nClust = 2:3, nRedraw = 2) #run 2 times for each cluster



