library(recommenderlab)


### Name: funkSVD
### Title: Funk SVD for Matrices with Missing Data
### Aliases: funkSVD predict.funkSVD
### Keywords: model

### ** Examples

### this takes a while to run
## Not run: 
##D data("Jester5k")
##D 
##D train <- as(Jester5k[1:100], "matrix")
##D fsvd <- funkSVD(train, verbose = TRUE)
##D 
##D ### reconstruct the rating matrix as R = UV'
##D ### and calculate the root mean square error on the known ratings
##D r <- tcrossprod(fsvd$U, fsvd$V)
##D rmse(train, r)
##D 
##D ### fold in new users for matrix completion
##D test <- as(Jester5k[101:105], "matrix")
##D p <- predict(fsvd, test, verbose = TRUE)
##D rmse(test, p)
## End(Not run)



