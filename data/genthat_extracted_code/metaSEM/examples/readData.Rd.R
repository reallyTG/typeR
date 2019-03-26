library(metaSEM)


### Name: readData
### Title: Read External Correlation/Covariance Matrices
### Aliases: readFullMat readStackVec readLowTriMat
### Keywords: utilities

### ** Examples

## Not run: 
##D ## Write two full correlation matrices into a file named "fullmat.dat".
##D ## x2 is missing in the second matrix.
##D ## The content of "fullmat.dat" is
##D # 1.0 0.3 0.4
##D # 0.3 1.0 0.5
##D # 0.4 0.5 1.0
##D # 1.0 NA 0.4
##D # NA NA NA
##D # 0.4 NA 1.0
##D cat("1.0 0.3 0.4\n0.3 1.0 0.5\n0.4 0.5 1.0
##D 1.0 NA 0.4\nNA NA NA\n0.4 NA 1.0",
##D file="fullmat.dat", sep="")
##D 
##D ## Read the correlation matrices
##D my.full <- readFullMat("fullmat.dat")
##D 
##D my.full
##D # $`1`
##D #     x1  x2  x3
##D # x1 1.0 0.3 0.4
##D # x2 0.3 1.0 0.5
##D # x3 0.4 0.5 1.0
##D #
##D # $`2`
##D #     x1 x2  x3
##D # x1 1.0 NA 0.4
##D # x2  NA NA  NA
##D # x3 0.4 NA 1.0
##D 
##D ## Write two lower triangle correlation matrices into a file named "lowertriangle.dat".
##D ## x2 is missing in the second matrix.
##D ## The content of "lowertriangle.dat" is
##D # 1.0 
##D # 0.3 1.0 
##D # 0.4 0.5 1.0
##D # 1.0
##D # NA NA 
##D # 0.4 NA 1.0
##D cat("1.0\n0.3 1.0\n0.4 0.5 1.0\n1.0\nNA NA\n0.4 NA 1.0",
##D     file="lowertriangle.dat", sep="")
##D 
##D ## Read the lower triangle correlation matrices
##D my.lowertri <- readLowTriMat(file = "lowertriangle.dat", no.var = 3)
##D 
##D my.lowertri
##D # $`1`
##D #     x1  x2  x3
##D # x1 1.0 0.3 0.4
##D # x2 0.3 1.0 0.5
##D # x3 0.4 0.5 1.0
##D #
##D # $`2`
##D #     x1 x2  x3
##D # x1 1.0 NA 0.4
##D # x2  NA NA  NA
##D # x3 0.4 NA 1.0
##D 
##D ## Write two vectors of correlation coefficients based on
##D ##  column major into a file named "stackvec.dat".
##D ## x2 is missing in the second matrix.
##D ## The content of "stackvec.dat" is
##D # 1.0 0.3 0.4 1.0 0.5 1.0
##D # 1.0 NA 0.4 NA NA 1.0
##D cat("1.0 0.3 0.4 1.0 0.5 1.0\n1.0 NA 0.4 NA NA 1.0\n",
##D     file="stackvec.dat", sep="")
##D 
##D my.vec <- readStackVec("stackvec.dat")
##D 
##D my.vec
##D # $`1`
##D #     x1  x2  x3
##D # x1 1.0 0.3 0.4
##D # x2 0.3 1.0 0.5
##D # x3 0.4 0.5 1.0
##D #
##D # $`2`
##D #    x1 x2  x3
##D # x1 1.0 NA 0.4
##D # x2  NA NA  NA
##D # x3 0.4 NA 1.0
## End(Not run)



