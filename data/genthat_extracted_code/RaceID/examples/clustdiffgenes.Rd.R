library(RaceID)


### Name: clustdiffgenes
### Title: Inference of differentially expressed genes in a cluster
### Aliases: clustdiffgenes

### ** Examples

sc <- SCseq(intestinalDataSmall)
sc <- filterdata(sc)
sc <- compdist(sc)
sc <- clustexp(sc)
sc <- findoutliers(sc)
x <- clustdiffgenes(sc,1)
head(x[x$fc>1,])



