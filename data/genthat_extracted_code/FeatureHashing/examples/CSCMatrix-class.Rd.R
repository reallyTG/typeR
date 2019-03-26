library(FeatureHashing)


### Name: CSCMatrix-class
### Title: CSCMatrix
### Aliases: CSCMatrix-class [,CSCMatrix,missing,numeric,ANY-method
###   [,CSCMatrix,numeric,missing,ANY-method
###   [,CSCMatrix,numeric,numeric,ANY-method %*%,CSCMatrix,numeric-method
###   %*%,numeric,CSCMatrix-method dim,CSCMatrix-method
###   dim<-,CSCMatrix-method

### ** Examples

# construct a CSCMatrix
m <- hashed.model.matrix(~ ., CO2, 8)
# convert it to dgCMatrix
m2 <- as(m, "dgCMatrix")



