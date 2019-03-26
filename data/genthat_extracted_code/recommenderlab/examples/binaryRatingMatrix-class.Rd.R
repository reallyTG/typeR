library(recommenderlab)


### Name: binaryRatingMatrix
### Title: Class "binaryRatingMatrix": A Binary Rating Matrix
### Aliases: binaryRatingMatrix-class binaryRatingMatrix
###   coerce,matrix,binaryRatingMatrix-method
###   coerce,itemMatrix,binaryRatingMatrix-method
###   coerce,data.frame,binaryRatingMatrix-method
###   coerce,binaryRatingMatrix,matrix-method
###   coerce,binaryRatingMatrix,dgTMatrix-method
###   coerce,binaryRatingMatrix,ngCMatrix-method
###   coerce,binaryRatingMatrix,dgCMatrix-method
###   coerce,binaryRatingMatrix,itemMatrix-method
###   coerce,binaryRatingMatrix,list-method
### Keywords: classes

### ** Examples

## create a 0-1 matrix
m <- matrix(sample(c(0,1), 50, replace=TRUE), nrow=5, ncol=10,
    dimnames=list(users=paste("u", 1:5, sep=''), 
    items=paste("i", 1:10, sep='')))
m

## coerce it into a binaryRatingMatrix
b <- as(m, "binaryRatingMatrix")
b

## coerce it back to see if it worked
as(b, "matrix")

## use some methods defined in ratingMatrix
dim(b)
dimnames(b)

## counts
rowCounts(b)
colCounts(b)

## plot
image(b)

## sample and subset
sample(b,2)
b[1:2,1:5]

## coercion
as(b, "list")
head(as(b, "data.frame"))
head(getData.frame(b, ratings=FALSE))

## creation from user/item tuples
df <- data.frame(user=c(1,1,2,2,2,3), items=c(1,4,1,2,3,5))
df
b2 <- as(df, "binaryRatingMatrix")
b2
as(b2, "matrix")



