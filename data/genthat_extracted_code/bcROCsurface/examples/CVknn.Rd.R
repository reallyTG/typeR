library(bcROCsurface)


### Name: CVknn
### Title: Cross-validation for K nearest-neighbor regression
### Aliases: CVknn

### ** Examples

data(EOC)
XX <- cbind(EOC$CA125, EOC$CA153, EOC$Age)
Dna <- preDATA(EOC$D, EOC$CA125)
Dvec.na <- Dna$Dvec
CVknn(XX, Dvec.na, EOC$V, type = "mahala", plot = TRUE)




