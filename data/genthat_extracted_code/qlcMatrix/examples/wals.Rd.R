library(qlcMatrix)


### Name: WALS
### Title: The World Atlas of Language Structures (WALS)
### Aliases: wals
### Keywords: datasets

### ** Examples

data(wals)

# plot all locations of the WALS languages, looks like a world map
plot(wals$meta[,4:5])

# turn the large and mostly empty dataframe into sparse matrices
# recoding is nicely optimized and quick for this reasonably large dataset
# this works perfect as long as things stay within available RAM of the computer
system.time(
  W <- splitTable(wals$data)
)

# as an aside: note that the recoding takes only about 30% of the space
as.numeric( object.size(W) / object.size(wals$data) )

# compute similarities (Chuprov's T, similar to Cramer's V) 
# between all pairs of variables using sparse Matrix methods
system.time(sim <- sim.att(wals$data, method = "chuprov"))

# some structure visible
rownames(sim) <- colnames(wals$data)
plot(hclust(as.dist(1-sim), method = "ward"), cex = 0.5)




