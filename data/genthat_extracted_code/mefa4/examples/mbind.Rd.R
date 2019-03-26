library(mefa4)


### Name: mbind
### Title: Combine R Objects by Rows and Columns
### Aliases: mbind mbind,matrix,matrix-method
###   mbind,sparseMatrix,sparseMatrix-method mbind,Mefa,Mefa-method mbind2
###   mbind2,matrix,matrix-method mbind2,sparseMatrix,sparseMatrix-method
### Keywords: methods manip

### ** Examples

x=matrix(1:4,2,2)
rownames(x) <- c("a","b")
colnames(x) <- c("A","B")
y=matrix(11:14,2,2)
rownames(y) <- c("b","c")
colnames(y) <- c("B","C")

sampx <- data.frame(x1=1:2, x2=2:1)
rownames(sampx) <- rownames(x)
sampy <- data.frame(x1=3:4, x3=10:11)
rownames(sampy) <- rownames(y)
taxay <- data.frame(x1=1:2, x2=2:1)
rownames(taxay) <- colnames(y)
taxax <- NULL

mbind(x,y)
mbind(as(x,"sparseMatrix"),as(y,"sparseMatrix"))
xy <- mbind(Mefa(x,sampx),Mefa(y,sampy,taxay))
unclass(xy)

mbind2(x,y)
mbind2(as(x,"sparseMatrix"),as(y,"sparseMatrix"))
xtab(xy) <- mbind2(x, y)
unclass(xy)



