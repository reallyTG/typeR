library(Rmpfr)


### Name: mpfrArray
### Title: Construct "mpfrArray" almost as by 'array()'
### Aliases: mpfrArray
### Keywords: array

### ** Examples

## preallocating is possible here too
ma <- mpfrArray(NA, prec = 80, dim = 2:4)
validObject(A2 <- mpfrArray(1:24, prec = 64, dim = 2:4))

## recycles, gives an "mpfrMatrix" and dimnames :
mat <- mpfrArray(1:5, 64, dim = c(5,3), dimnames=list(NULL, letters[1:3]))
mat
asNumeric(mat)
stopifnot(identical(asNumeric(mat),
                    matrix(1:5 +0, 5,3, dimnames=dimnames(mat))))

## Testing the apply() method :
apply(mat, 2, range)
apply(A2, 1:2, range)
apply(A2, 2:3, max)
(fA2 <- apply(A2, 2, fivenum))
a2 <- as(A2, "array")
stopifnot(as(apply(A2, 2, range), "matrix") ==
             apply(a2, 2, range)
        , all.equal(fA2, apply(a2, 2, fivenum))
        , all.equal(apply(A2, 2, quantile),
                    apply(a2, 2, quantile))
        , all.equal(A2, apply(A2, 2:3, identity) -> aA2, check.attributes=FALSE)
        , dim(A2) == dim(aA2)
)
## Don't show: 
 for(nf in c("colSums", "colMeans", "rowSums", "rowMeans")) {
   FUN <- getFunction(nf)
   for(di in c(1,2)) {
     r <- FUN(a2, dims = di)
     R <- FUN(A2, dims = di)
     stopifnot(dim(r) == dim(R),
               all.equal(as(R, if(is.array(r)) "array" else "numeric"),
                         unname(r), tol = 1e-15))
   }
 }
## with non-trivial dimnames:
ma2 <- mat
dimnames(ma2) <- list(row=paste0("r",1:5), col=colnames(mat))
stopifnot(identical(ma2,   apply(ma2, 2, identity)),
          identical(ma2, t(apply(ma2, 1, identity))),
          identical(names(apply(ma2,2,sum)), colnames(ma2))
)
## End(Don't show)



