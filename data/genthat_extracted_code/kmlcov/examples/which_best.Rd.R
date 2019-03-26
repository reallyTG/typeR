library(kmlcov)


### Name: which_best
### Title: Seek the best partitions
### Aliases: which_best

### ** Examples

data(artifdata)
res <- kmlCov(formula = Y ~ clust(time + time2), data = artifdata, ident = 'id',
timeVar = 'time', effectVar = 'treatment', nClust = 2:3, nRedraw = 2) # run 2 times the algorithm
best <- which_best(res) # return the best partition of each cluster
plot(best)



