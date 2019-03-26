library(MSnbase)


### Name: purityCorrect-methods
### Title: Performs reporter ions purity correction
### Aliases: purityCorrect-methods purityCorrect makeImpuritiesMatrix
### Keywords: methods

### ** Examples

## quantifying full experiment
data(msnset)
impurities <- matrix(c(0.929,0.059,0.002,0.000,
                       0.020,0.923,0.056,0.001,
                       0.000,0.030,0.924,0.045,
                       0.000,0.001,0.040,0.923),
                     nrow=4, byrow = TRUE)
## or, using makeImpuritiesMatrix()
## Not run: impurities <- makeImpuritiesMatrix(4)
msnset.crct <- purityCorrect(msnset, impurities)
head(exprs(msnset))
head(exprs(msnset.crct))
processingData(msnset.crct)

## default impurity matrix for iTRAQ 8-plex
makeImpuritiesMatrix(8, edit = FALSE)

## default impurity matrix for TMT 10-plex
makeImpuritiesMatrix(10, edit = FALSE)



