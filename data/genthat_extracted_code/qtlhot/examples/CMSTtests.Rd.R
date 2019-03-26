library(qtlhot)


### Name: CMSTtests
### Title: Perform CMST Tests on cross object
### Aliases: CMSTtests CMSTtestsList
### Keywords: utilities

### ** Examples

data(CMSTCross)
nms <- names(CMSTCross$pheno)
out1 <- CMSTtests(CMSTCross, 
                  pheno1 = nms[1], 
                  pheno2 = nms[2],
                  Q.chr = 1,
                  Q.pos = 55,
                  addcov1 = NULL, 
                  addcov2 = NULL, 
                  intcov1 = NULL, 
                  intcov2 = NULL, 
                  method = "all",
                  penalty = "both")
out1[1:6]
out1[7]
out1[8:12]
out1[13:17]
## list of phenotypes
out2 <- CMSTtests(CMSTCross, 
                  pheno1 = nms[1], 
                  pheno2 = nms[-1],
                  Q.chr = 1,
                  Q.pos = 55,
                  addcov1 = NULL, 
                  addcov2 = NULL, 
                  intcov1 = NULL, 
                  intcov2 = NULL, 
                  method = "par",
                  penalty = "bic")
out2



