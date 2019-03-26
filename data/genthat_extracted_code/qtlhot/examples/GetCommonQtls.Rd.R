library(qtlhot)


### Name: GetCommonQtls
### Title: Get common QTLs for phenotypes
### Aliases: GetCommonQtls
### Keywords: utilities

### ** Examples

data(CMSTCross)
commqtls <- GetCommonQtls(CMSTCross, 
                          pheno1 = "y1", 
                          pheno2 = "y3",
                          thr = 3,
                          peak.dist = 5,
                          addcov1 = NULL, 
                          addcov2 = NULL, 
                          intcov1 = NULL, 
                          intcov2 = NULL)
commqtls



