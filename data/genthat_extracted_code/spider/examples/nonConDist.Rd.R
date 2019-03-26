library(spider)


### Name: nonConDist
### Title: Nearest non-conspecific and maximum intra-specific distances
### Aliases: nonConDist
### Keywords: Barcoding

### ** Examples


data(anoteropsis)
anoDist <- ape::dist.dna(anoteropsis)
anoSpp <- sapply(strsplit(dimnames(anoteropsis)[[1]], split="_"), 
    function(x) paste(x[1], x[2], sep="_"))

nonConDist(anoDist, anoSpp)
nonConDist(anoDist, anoSpp, propZero=TRUE)

maxInDist(anoDist, anoSpp)
maxInDist(anoDist, anoSpp, propZero=TRUE)

#Barcoding gap
inter <- nonConDist(anoDist, anoSpp)
intra <- maxInDist(anoDist, anoSpp)
graphics::hist(inter-intra)

#An alternative way of plotting the gap
bnd <- cbind(data.frame(inter, intra))
ord <- bnd[order(bnd$inter),]
graphics::plot(ord$inter, type="n", ylab="Percent K2P distance", xlab="Individual")
segCol <- rep("gray50", length(ord$inter))
segCol[ord$inter-ord$intra < 0] <- "red"
graphics::segments(x0=1:length(ord$inter), y0=ord$inter, y1=ord$intra, col=segCol, lwd=6)




