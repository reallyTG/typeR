library(RaceID)


### Name: findoutliers
### Title: Inference of outlier cells and final clustering
### Aliases: findoutliers

### ** Examples

sc <- SCseq(intestinalDataSmall)
sc <- filterdata(sc)
sc <- compdist(sc)
sc <- clustexp(sc)
sc <- findoutliers(sc)



