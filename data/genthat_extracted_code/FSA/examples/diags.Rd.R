library(FSA)


### Name: diags
### Title: Extract diagonals from a matrix.
### Aliases: diags
### Keywords: manip

### ** Examples

## Square numeric matrix
mat1 <- matrix(1:16,nrow=4)
colnames(mat1) <- LETTERS[1:ncol(mat1)]
rownames(mat1) <- 1:nrow(mat1)
mat1
diags(mat1,which=NULL)
diags(mat1)
diags(mat1,which=-1)
diags(mat1,which=2)
diags(mat1,incl.labels="row")
diags(mat1,which=2,incl.labels="row")
diags(mat1,which=2,incl.labels="col")
( tmp <- diags(mat1,which=2,incl.labels="row",val.name="Freq",label.name="age") )
str(tmp)

## Rectangular numeric matrix
mat2 <- matrix(1:20,nrow=4)
colnames(mat2) <- LETTERS[1:ncol(mat2)]
rownames(mat2) <- 1:nrow(mat2)
mat2
diags(mat2,which=NULL)
diags(mat2,which=-1,incl.labels="row")
diags(mat2,which=2,incl.labels="row")
diags(mat2,which=-4,incl.labels="col")

## Rectangular character matrix
mat3 <- matrix(LETTERS[1:24],nrow=3)
colnames(mat3) <- letters[1:ncol(mat3)]
rownames(mat3) <- 1:nrow(mat3)
mat3
diags(mat3,which=NULL)
diags(mat3,which=-1,incl.labels="row")
diags(mat3,which=2,incl.labels="row")
diags(mat3,which=-4,incl.labels="col")




