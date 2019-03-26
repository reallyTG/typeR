library(RaceID)


### Name: comptsne
### Title: Computation of a two dimensional t-SNE representation
### Aliases: comptsne

### ** Examples

sc <- SCseq(intestinalDataSmall)
sc <- filterdata(sc)
sc <- compdist(sc)
sc <- clustexp(sc)
sc <- findoutliers(sc)
sc <- comptsne(sc)



