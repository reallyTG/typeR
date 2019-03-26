library(splusTimeSeries)


### Name: as.rectangular
### Title: Uniform Rectangular Data Functions
### Aliases: as.rectangular as.char.rect is.rectangular subscript2d
###   subscript2d,ANY-method subscript2d,data.frame-method
###   subscript2d,matrix-method subscript2d<- subscript2d<-,ANY-method
###   subscript2d<-,data.frame-method subscript2d<-,matrix-method numRows
###   numRows,ANY-method numRows<- numRows<-,ANY-method
###   numRows<-,data.frame-method nrow<- nrow<-,ANY-method
###   nrow<-,data.frame-method numCols numCols,ANY-method numCols<-
###   numCols<-,ANY-method numCols<-,data.frame-method ncol<-
###   ncol<-,ANY-method ncol<-,data.frame-method rowIds rowIds,ANY-method
###   rowIds<- rowIds<-,ANY-method colIds colIds,ANY-method colIds<-
###   colIds<-,ANY-method
### Keywords: manip

### ** Examples

x <- 1:10 
y <- list(a=1:10, b=11:20) 
is.rectangular(x) 
y <- as.rectangular(y) 
subscript2d(x,3,1) 
subscript2d(y,4,1) <- 55 
numRows(x) 
numCols(y) <- 3 
rowIds(x) <- letters[1:10] 
colIds(y) 
z <- cbind(1,1:4)
colnames(z)
colnames(z) <- colnames(z)
rownames(z) <- rownames(z)



