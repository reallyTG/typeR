library(BIOM.utils)


### Name: BIOM Export
### Title: Convert BIOM data from formal to basic type (export)
### Aliases: as.matrix.biom as.list.biom as.character.biom

### ** Examples

tt <- tempfile()
xx <- biom (li3)
yy <- biom (smat, sparse=TRUE, quiet=TRUE)

##  extract objects of basic types:
print (as.matrix (xx))
head (as.matrix (yy, expand=TRUE))
as.character (xx)
as.character (xx, file=tt)
str (as.list (xx))

##  export to a CSV file:
write.table (as.matrix (xx), file=tt, sep=",")

## Not run: 
##D ##  a classed sparse matrix (for computation or what have you):
##D zz <- as.matrix (yy)
##D zz[,1:2] <- 1 + zz[,1:2]
##D Matrix::sparseMatrix (i=zz[,1], j=zz[,2], x=zz[,3])
## End(Not run)

unlink(tt)



