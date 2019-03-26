library(RaceID)


### Name: plotdiffgenes
### Title: Barplot of differentially expressed genes
### Aliases: plotdiffgenes

### ** Examples

sc <- SCseq(intestinalDataSmall)
sc <- filterdata(sc)
sc <- compdist(sc)
sc <- clustexp(sc)
sc <- findoutliers(sc)
x <- diffgenes(sc,1,2)
head(x$z)
plotdiffgenes(x,names(x$z)[1])



