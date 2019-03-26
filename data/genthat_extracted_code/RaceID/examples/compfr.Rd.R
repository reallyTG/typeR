library(RaceID)


### Name: compfr
### Title: Computation of a two dimensional Fruchterman-Rheingold
###   representation
### Aliases: compfr

### ** Examples

sc <- SCseq(intestinalDataSmall)
sc <- filterdata(sc)
sc <- compdist(sc)
sc <- clustexp(sc)
sc <- findoutliers(sc)
sc <- compfr(sc)



