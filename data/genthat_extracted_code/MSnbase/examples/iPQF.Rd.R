library(MSnbase)


### Name: iPQF
### Title: iPQF: iTRAQ (and TMT) Protein Quantification based on Features
### Aliases: iPQF

### ** Examples

data(msnset2)
head(exprs(msnset2))
prot <- combineFeatures(msnset2,
                        groupBy = fData(msnset2)$accession,
                        fun = "iPQF")
head(exprs(prot))



