library(spider)


### Name: sppDist
### Title: Intra and inter-specific distances
### Aliases: sppDist
### Keywords: Barcoding

### ** Examples


data(dolomedes)
doloDist <- ape::dist.dna(dolomedes)
doloSpp <- substr(dimnames(dolomedes)[[1]], 1, 5)

doloSpDist <- sppDist(doloDist, doloSpp)

doloSpDist

#Histogram of the barcode gap
transGreen <- rgb(0, 1, 0, 0.5) #Make a slightly transparent colour to see some overlap
graphics::hist(doloSpDist$inter, col="grey")
graphics::hist(doloSpDist$intra, col=transGreen, add=TRUE)

#Boxplot of the same
graphics::boxplot(doloSpDist)




