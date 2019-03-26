library(HistData)


### Name: Yeast
### Title: Student's (1906) Yeast Cell Counts
### Aliases: Yeast YeastD.mat
### Keywords: datasets

### ** Examples

data(Yeast)

require(lattice)
# basic bar charts 
# TODO: frequencies should start at 0, not 1.
barchart(count~freq|sample, data=Yeast, ylab="Number of Cells", xlab="Frequency")
barchart(freq~count|sample, data=Yeast, xlab="Number of Cells", ylab="Frequency",
	horizontal=FALSE, origin=0)

# same, using xyplot
xyplot(freq~count|sample, data=Yeast, xlab="Number of Cells", ylab="Frequency",
	horizontal=FALSE, origin=0, type="h", lwd=10)



