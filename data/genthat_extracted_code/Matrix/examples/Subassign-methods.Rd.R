library(Matrix)


### Name: [<--methods
### Title: Methods for "[<-" - Assigning to Subsets for 'Matrix'
### Aliases: [<--methods Subassign-methods [<-,Matrix,ANY,ANY,ANY-method
###   [<-,Matrix,ANY,ANY,Matrix-method [<-,Matrix,ANY,missing,Matrix-method
###   [<-,Matrix,missing,ANY,Matrix-method [<-,Matrix,ANY,ANY,matrix-method
###   [<-,Matrix,ANY,missing,matrix-method
###   [<-,Matrix,missing,ANY,matrix-method
###   [<-,Matrix,matrix,missing,replValue-method
###   [<-,Matrix,lsparseMatrix,missing,replValue-method
###   [<-,Matrix,nsparseMatrix,missing,replValue-method
###   [<-,Matrix,ldenseMatrix,missing,replValue-method
###   [<-,Matrix,ndenseMatrix,missing,replValue-method
###   [<-,denseMatrix,index,missing,replValue-method
###   [<-,denseMatrix,index,index,replValue-method
###   [<-,denseMatrix,matrix,missing,replValue-method
###   [<-,denseMatrix,missing,index,replValue-method
###   [<-,denseMatrix,missing,missing,ANY-method
###   [<-,diagonalMatrix,index,index,replValue-method
###   [<-,diagonalMatrix,index,missing,replValue-method
###   [<-,diagonalMatrix,matrix,missing,replValue-method
###   [<-,diagonalMatrix,missing,index,replValue-method
###   [<-,diagonalMatrix,missing,missing,ANY-method
###   [<-,diagonalMatrix,index,index,sparseMatrix-method
###   [<-,diagonalMatrix,index,missing,sparseMatrix-method
###   [<-,diagonalMatrix,missing,index,sparseMatrix-method
###   [<-,diagonalMatrix,index,index,sparseVector-method
###   [<-,diagonalMatrix,index,missing,sparseVector-method
###   [<-,diagonalMatrix,missing,index,sparseVector-method
###   [<-,sparseMatrix,ANY,ANY,sparseMatrix-method
###   [<-,sparseMatrix,ANY,missing,sparseMatrix-method
###   [<-,sparseMatrix,missing,ANY,sparseMatrix-method
###   [<-,sparseMatrix,missing,missing,ANY-method
###   [<-,indMatrix,index,ANY,ANY-method
###   [<-,indMatrix,missing,index,ANY-method
###   [<-,indMatrix,missing,missing,ANY-method
###   [<-,TsparseMatrix,index,index,replValue-method
###   [<-,TsparseMatrix,index,missing,replValue-method
###   [<-,TsparseMatrix,matrix,missing,replValue-method
###   [<-,TsparseMatrix,Matrix,missing,replValue-method
###   [<-,TsparseMatrix,lMatrix,missing,replValue-method
###   [<-,TsparseMatrix,nMatrix,missing,replValue-method
###   [<-,TsparseMatrix,missing,index,replValue-method
###   [<-,TsparseMatrix,missing,index,sparseVector-method
###   [<-,TsparseMatrix,index,missing,sparseVector-method
###   [<-,TsparseMatrix,index,index,sparseVector-method
###   [<-,CsparseMatrix,index,index,replValue-method
###   [<-,CsparseMatrix,index,missing,replValue-method
###   [<-,CsparseMatrix,Matrix,missing,replValue-method
###   [<-,CsparseMatrix,matrix,missing,replValue-method
###   [<-,CsparseMatrix,lsparseMatrix,missing,replValue-method
###   [<-,CsparseMatrix,nsparseMatrix,missing,replValue-method
###   [<-,CsparseMatrix,ldenseMatrix,missing,replValue-method
###   [<-,CsparseMatrix,ndenseMatrix,missing,replValue-method
###   [<-,CsparseMatrix,missing,index,replValue-method
###   [<-,CsparseMatrix,missing,index,sparseVector-method
###   [<-,CsparseMatrix,index,missing,sparseVector-method
###   [<-,CsparseMatrix,index,index,sparseVector-method
###   [<-,RsparseMatrix,index,index,replValue-method
###   [<-,RsparseMatrix,index,missing,replValue-method
###   [<-,RsparseMatrix,matrix,missing,replValue-method
###   [<-,RsparseMatrix,missing,index,replValue-method
###   [<-,RsparseMatrix,missing,index,sparseVector-method
###   [<-,RsparseMatrix,index,missing,sparseVector-method
###   [<-,RsparseMatrix,index,index,sparseVector-method
### Keywords: methods array

### ** Examples

set.seed(101)
(a <- m <- Matrix(round(rnorm(7*4),2), nrow = 7))

a[] <- 2.2 # <<- replaces **every** entry
a
## as do these:
a[,] <- 3 ; a[TRUE,] <- 4

m[2, 3]  <- 3.14 # simple number
m[3, 3:4]<- 3:4  # simple numeric of length 2

## sub matrix assignment:
m[-(4:7), 3:4] <- cbind(1,2:4) #-> upper right corner of 'm'
m[3:5, 2:3] <- 0
m[6:7, 1:2] <- Diagonal(2)
m

## rows or columns only:
m[1,] <- 10
m[,2] <- 1:7
m[-(1:6), ] <- 3:0 # not the first 6 rows, i.e. only the 7th
as(m, "sparseMatrix")



