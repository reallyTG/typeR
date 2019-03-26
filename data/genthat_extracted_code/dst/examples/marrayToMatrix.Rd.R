library(dst)


### Name: marrayToMatrix
### Title: Transformation of an array data to a matrix-represented relation
### Aliases: marrayToMatrix

### ** Examples

 wr_infovar = matrix(c(4,5,2,2), ncol = 2, 
 dimnames = list(NULL, c("varnb", "size")) )
 mtt <- array(c(0,1,0,0,0,0,0,1,0,1,0,1,1,0,1,0,1,1,1,0,1,0,1,1,1,1,1,1), c(2,2,7), 
 dimnames = list( RdWorks=c("rWdy", "rWdn") , Rain=c("Ry", "Rn"), ev=1:7))
z <- marrayToMatrix(mtt, wr_infovar)




