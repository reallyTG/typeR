library(fuzzySim)


### Name: simMat
### Title: Pair-wise (fuzzy) similarity matrix
### Aliases: simMat

### ** Examples


# load and look at the rotif.env presence-absence data:

data(rotif.env)

head(rotif.env)

names(rotif.env)


# build a matrix of similarity among these binary data
# using e.g. Jaccard's index:

bin.sim.mat <- simMat(rotif.env[ , 18:47], method = "Jaccard")

head(bin.sim.mat)


# calculate a fuzzy version of the presence-absence data
# based on inverse distance to presences:

rotifers.invd <- distPres(rotif.env, sp.cols = 18:47,
coord.cols = c("Longitude", "Latitude"), id.col = 1, suffix = ".d", 
p = 1, inv = TRUE)

head(rotifers.invd)


# build a matrix of fuzzy similarity among these fuzzy 
# distribution data, using the fuzzy version of Jaccard's index:

fuz.sim.mat <- simMat(rotifers.invd[ , -1], method = "Jaccard")

head(fuz.sim.mat)


# plot the similarity matrices as colours:

image(x = 1:ncol(bin.sim.mat), y = 1:nrow(bin.sim.mat), 
z = bin.sim.mat, col = rev(heat.colors(256)), xlab = "", ylab = "", 
axes = FALSE, main = "Binary similarity")
axis(side = 1, at = 1:ncol(bin.sim.mat), tick = FALSE,
labels = colnames(bin.sim.mat), las = 2)
axis(side = 2, at = 1:nrow(bin.sim.mat), tick = FALSE,
labels = rownames(bin.sim.mat), las = 2)

image(x = 1:ncol(fuz.sim.mat), y = 1:nrow(fuz.sim.mat), 
z = fuz.sim.mat, col = rev(heat.colors(256)), xlab = "", ylab = "", 
axes = FALSE, main = "Fuzzy similarity")
axis(side = 1, at = 1:ncol(fuz.sim.mat), tick = FALSE,
labels = colnames(fuz.sim.mat), las = 2, cex = 0.5)
axis(side = 2, at = 1:nrow(fuz.sim.mat), tick = FALSE,
labels = rownames(fuz.sim.mat), las = 2)


# plot a UPGMA dendrogram from each similarity matrix:

plot(hclust(as.dist(1 - bin.sim.mat), method = "average"),
main = "Binary cluster dendrogram")

plot(hclust(as.dist(1 - fuz.sim.mat), method = "average"),
main = "Fuzzy cluster dendrogram")


# you can get fuzzy chorotypes from these similarity matrices
# (or fuzzy biotic regions if you \code{transpose} 'data'),
# so that localities are in columns and species in rows)
# using the \pkg{RMACOQUI} package (Olivero et al. 2011)



