library(miLineage)


### Name: ZIGDM
### Title: Zero-Inflated Generalized Dirichlet Multinomial (ZIGDM) Tests
### Aliases: ZIGDM
### Keywords: parametric association test

### ** Examples

data(data.toy)
OTU.toy = data.toy$OTU.toy
Tax.toy = data.toy$Tax.toy
case = data.toy$covariate.toy
# the OTUs should be consistent between the OTU table and the taxonomy table
OTU.toy.reorder = OTU.toy[,match(rownames(Tax.toy), colnames(OTU.toy))]
# perform ZIGDM test for detecting differential dispersion
ZIGDM(OTU.toy.reorder, NULL, NULL, case, test.type = "Disp", 1, 
  ZI.LB = 10, Tax.toy, fdr.alpha = 0.05)



