library(MSnbase)


### Name: nFeatures
### Title: How many features in a group?
### Aliases: nFeatures

### ** Examples

library(pRolocdata)
data("hyperLOPIT2015ms3r1psm")
hyperLOPIT2015ms3r1psm <- nFeatures(hyperLOPIT2015ms3r1psm,
                                    "Protein.Group.Accessions")
i <- c("Protein.Group.Accessions", "Protein.Group.Accessions.nFeatures")
fData(hyperLOPIT2015ms3r1psm)[1:10, i]



