library(mptools)


### Name: results
### Title: Extract simulation results from RAMAS Metapop .mp files
### Aliases: results

### ** Examples

mp <- system.file('example.mp', package='mptools')
res <- results(mp)
str(res)

# look at the simulation results for the first array slice (NB: this slice is
# all pops combined):
res$results[,, 1]
# equivalently, subset by name:
res$results[,, 'ALL']
res$results[,, 'Pop 190']
res$results[,, '240A24']
dimnames(res$results)[[3]] # population names

# return a matrix of mean population sizes, where columns represent
# populations and rows are time steps:
res$results[, 1, ] # or res$results[, 'mean', ]

# sd across iterations:
res$results[, 2, ] # or res$results[, 'sd', ]

# min pop sizes across iterations:
res$results[, 3, ] # or res$results[, 'min', ]

# max pop sizes across iterations:
res$results[, 4, ] # or res$results[, 'max', ] 



