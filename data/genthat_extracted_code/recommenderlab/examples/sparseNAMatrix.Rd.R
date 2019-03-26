library(recommenderlab)


### Name: sparseNAMatrix-class
### Title: Sparse Matrix Representation With NAs Not Explicitly Stored
### Aliases: dropNA dropNA2matrix

### ** Examples

m <- matrix(sample(c(NA,0:5),50, replace=TRUE, prob=c(.5,rep(.5/6,6))),
    nrow=5, ncol=10, dimnames = list(users=paste('u', 1:5, sep=''),
    items=paste('i', 1:10, sep='')))
m

## drop all NAs in the representation
sparse <- dropNA(m)
sparse

## convert back to matrix
dropNA2matrix(sparse)



