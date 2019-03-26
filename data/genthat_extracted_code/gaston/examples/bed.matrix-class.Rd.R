library(gaston)


### Name: bed.matrix-class
### Title: Class '"bed.matrix"'
### Aliases: bed.matrix-class bed.matrix
###   [,bed.matrix,logical,logical,missing-method
###   [,bed.matrix,logical,missing,missing-method
###   [,bed.matrix,logical,numeric,missing-method
###   [,bed.matrix,missing,logical,missing-method
###   [,bed.matrix,missing,numeric,missing-method
###   [,bed.matrix,numeric,logical,missing-method
###   [,bed.matrix,numeric,missing,missing-method
###   [,bed.matrix,numeric,numeric,missing-method
###   %*%,bed.matrix,matrix-method %*%,matrix,bed.matrix-method
###   %*%,bed.matrix,vector-method %*%,vector,bed.matrix-method
###   as.matrix,bed.matrix-method
###   matrix,data.frameOrNULL,data.frameOrNULL-method standardize
###   standardize,bed.matrix-method standardize<-
###   standardize<-,bed.matrix-method coerce,bed.matrix,matrix-method
###   coerce,matrix,bed.matrix-method coerce,bed.matrix,vector-method
###   coerce,vector,bed.matrix-method dim,bed.matrix-method
###   head,bed.matrix-method mu mu,bed.matrix-method mu<-
###   mu<-,bed.matrix-method p p,bed.matrix-method p<-
###   p<-,bed.matrix-method show,bed.matrix-method sigma
###   sigma,bed.matrix-method sigma<- sigma<-,bed.matrix-method rbind
###   rbind,bed.matrix-method cbind cbind,bed.matrix-method
### Keywords: classes

### ** Examples

showClass("bed.matrix")

# Conversion example
data(LCT)
x1 <- as(LCT.gen, "bed.matrix")
x1
head(x1@ped)
head(x1@snps)

# the function as.bed.matrix is an alternative
x2 <- as.bed.matrix(LCT.gen, LCT.fam, LCT.bim)
x2
head(x2@ped)
head(x2@snps)



