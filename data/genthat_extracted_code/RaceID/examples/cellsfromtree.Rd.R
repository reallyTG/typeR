library(RaceID)


### Name: cellsfromtree
### Title: Extract Cells on Differentiation Trajectory
### Aliases: cellsfromtree

### ** Examples

sc <- SCseq(intestinalDataSmall)
sc <- filterdata(sc)
sc <- compdist(sc)
sc <- clustexp(sc)
sc <- findoutliers(sc)
sc <- comptsne(sc)
ltr <- Ltree(sc)
ltr <- compentropy(ltr)
ltr <- projcells(ltr)
ltr <- lineagegraph(ltr)
ltr <- comppvalue(ltr)
x <- cellsfromtree(ltr,c(1,3,6,2))



