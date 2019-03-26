library(spider)


### Name: tclust
### Title: Clustering by a threshold
### Aliases: tclust
### Keywords: Barcoding

### ** Examples



data(anoteropsis)
anoSpp <- sapply(strsplit(dimnames(anoteropsis)[[1]], split="_"), 
	function(x) paste(x[1], x[2], sep="_"))
anoDist <- ape::dist.dna(anoteropsis)

tclust(anoDist)

#Names of individuals
anoClust <- tclust(anoDist)
lapply(anoClust, function(x) anoSpp[x])




