library(miLineage)


### Name: QCAT_GEE
### Title: QCAT+GEE Two-Part Test
### Aliases: QCAT_GEE
### Keywords: nonparametric association test

### ** Examples

data(data.toy)
OTU.toy = data.toy$OTU.toy
Tax.toy = data.toy$Tax.toy
case = data.toy$covariate.toy
# the OTUs should be consistent between the OTU table and the taxonomy table
OTU.toy.reorder = OTU.toy[,match(rownames(Tax.toy), colnames(OTU.toy))]
# perform QCAT+GEE test
QCAT_GEE(OTU.toy.reorder, case, 1, case, 1, Tax.toy, fdr.alpha=0.05)



