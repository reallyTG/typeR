library(recommenderlab)


### Name: realRatingMatrix
### Title: Class "realRatingMatrix": Real-valued Rating Matrix
### Aliases: realRatingMatrix-class realRatingMatrix
###   coerce,matrix,realRatingMatrix-method
###   coerce,realRatingMatrix,matrix-method
###   coerce,realRatingMatrix,dgTMatrix-method
###   coerce,dgTMatrix,realRatingMatrix-method
###   coerce,realRatingMatrix,ngCMatrix-method
###   coerce,realRatingMatrix,dgCMatrix-method
###   coerce,dgCMatrix,realRatingMatrix-method
###   coerce,data.frame,realRatingMatrix-method
###   coerce,realRatingMatrix,data.frame-method rowSds
###   rowSds,realRatingMatrix-method colSds colSds,realRatingMatrix-method
###   binarize binarize,realRatingMatrix-method removeKnownRatings
###   removeKnownRatings,realRatingMatrix-method
###   [<-,realRatingMatrix,ANY,ANY,ANY-method
### Keywords: classes

### ** Examples

## create a matrix with ratings
m <- matrix(sample(c(NA,0:5),100, replace=TRUE, prob=c(.7,rep(.3/6,6))),
	nrow=10, ncol=10, dimnames = list(
	    user=paste('u', 1:10, sep=''),
	    item=paste('i', 1:10, sep='')
    ))
m

## coerce into a realRatingMAtrix
r <- as(m, "realRatingMatrix")
r

## get some information
dimnames(r)
rowCounts(r)
colCounts(r)
rowMeans(r)


## histogram of ratings
hist(getRatings(r), breaks="FD")

## inspect a subset
image(r[1:5,1:5])

## coerce it back to see if it worked
as(r, "matrix")

## coerce to data.frame (user/item/rating triplets)
as(r, "data.frame")

## binarize into a binaryRatingMatrix with all 4+ rating a 1
b <- binarize(r, minRating=4)
b
as(b, "matrix")



