library(sparseIndexTracking)


### Name: spIndexTrack
### Title: Sparse Index Tracking
### Aliases: spIndexTrack

### ** Examples

library(sparseIndexTracking)
library(xts)

# load data
data(INDEX_2010)

# fit portfolio under error measure ETE (Empirical Tracking Error)
w_ete <- spIndexTrack(INDEX_2010$X, INDEX_2010$SP500, lambda = 1e-7, u = 0.5, measure = 'ete')

# show cardinality achieved
cat("Number of assets used:", sum(w_ete > 1e-6))




