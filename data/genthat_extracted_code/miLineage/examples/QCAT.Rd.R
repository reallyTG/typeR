library(miLineage)


### Name: QCAT
### Title: Quasi-Conditional Association Test (QCAT)
### Aliases: QCAT
### Keywords: nonparametric association test

### ** Examples

data(data.toy)
OTU.toy = data.toy$OTU.toy
Tax.toy = data.toy$Tax.toy
case = data.toy$covariate.toy
# the OTUs should be consistent between the OTU table and the taxonomy table
OTU.toy.reorder = OTU.toy[,match(rownames(Tax.toy), colnames(OTU.toy))]
# perform QCAT
QCAT(OTU.toy.reorder, case, 1, Tax.toy, fdr.alpha=0.05)



