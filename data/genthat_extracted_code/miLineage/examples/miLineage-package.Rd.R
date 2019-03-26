library(miLineage)


### Name: miLineage-package
### Title: Association Tests for Microbial Lineages on a Taxonomic Tree
### Aliases: miLineage-package miLineage
### Keywords: package

### ** Examples

data(data.toy)
OTU.toy = data.toy$OTU.toy
Tax.toy = data.toy$Tax.toy
case = data.toy$covariate.toy
# the OTUs should be consistent between the OTU table and the taxonomy table
OTU.toy.reorder = OTU.toy[,match(rownames(Tax.toy), colnames(OTU.toy))]
# perform QCAT test for detecting differential mean
QCAT(OTU.toy.reorder, case, 1, Tax.toy, fdr.alpha=0.05)
# perform ZIGDM test for detecting differential dispersion
ZIGDM(OTU.toy.reorder, NULL, NULL, case, test.type = "Disp", 1, 
  ZI.LB = 10, Tax.toy, fdr.alpha = 0.05)




