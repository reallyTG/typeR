library(RaceID)


### Name: projback
### Title: Compute Cell Projections for Randomized Background Distribution
### Aliases: projback

### ** Examples

sc <- SCseq(intestinalDataSmall)
sc <- filterdata(sc)
sc <- compdist(sc)
sc <- clustexp(sc)
sc <- findoutliers(sc)
sc <- comptsne(sc)
ltr <- Ltree(sc)
ltr <- compentropy(ltr)
ltr <- projcells(ltr,nmode=FALSE)
ltr <- projback(ltr,pdishuf=50)



