library(RaceID)


### Name: rfcorrect
### Title: Random Forests-based Reclassification
### Aliases: rfcorrect

### ** Examples

sc <- SCseq(intestinalDataSmall)
sc <- filterdata(sc)
sc <- compdist(sc)
sc <- clustexp(sc)
sc <- findoutliers(sc)
sc <- rfcorrect(sc)



