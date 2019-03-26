library(gmp)


### Name: matrix
### Title: Matrix manipulation with gmp
### Aliases: matrix matrix.default matrix.bigz matrix.bigq is.matrixZQ
###   as.matrix.bigz as.matrix.bigq as.vector.bigq as.vector.bigz %*%
###   %*%.default %*%.bigq %*%.bigz crossprod crossprod.default
###   crossprod.bigq crossprod.bigz tcrossprod tcrossprod.default
###   tcrossprod.bigq tcrossprod.bigz ncol.bigq ncol.bigz nrow.bigq
###   nrow.bigz cbind.bigz cbind.bigq rbind.bigz rbind.bigq t.bigq t.bigz
###   dim.bigq dim<-.bigq dim.bigz dim<-.bigz
### Keywords: arith

### ** Examples

V <- as.bigz(v <- 3:7)
crossprod(V)# scalar product
(C <- t(V))
stopifnot(dim(C) == dim(t(v)), C == v,
          dim(t(C)) == c(length(v), 1),
          crossprod(V) == sum(V * V),
         tcrossprod(V) == outer(v,v),
          identical(C, t(t(C))),
          is.matrixZQ(C), !is.matrixZQ(V), !is.matrixZQ(5)
	)

## a matrix
x <- diag(1:4)
## invert this matrix
(xI <- solve(x))

## matrix in Z/7Z
y <- as.bigz(x,7)
## invert this matrix (result is *different* from solve(x)):
(yI <- solve(y))
stopifnot(yI %*% y == diag(4),
          y %*% yI == diag(4))

## matrix in Q
z  <- as.bigq(x)
## invert this matrix (result is the same as solve(x))
(zI <- solve(z))

stopifnot(abs(zI - xI) <= 1e-13,
          z %*% zI == diag(4),
          identical(crossprod(zI), zI %*% t(zI))
         )

A <- matrix(2^as.bigz(1:12), 3,4)
for(a in list(A, as.bigq(A, 16), factorialZ(20), as.bigq(2:9, 3:4))) {
  a.a <- crossprod(a)
  aa. <- tcrossprod(a)
  stopifnot(identical(a.a, crossprod(a,a)),
 	    identical(a.a, t(a) %*% a)
            ,
            identical(aa., tcrossprod(a,a)),
	    identical(aa., a %*% t(a))
 	   )
}# {for}



