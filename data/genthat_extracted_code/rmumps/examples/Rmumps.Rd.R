library(rmumps)


### Name: Rcpp_Rmumps-class
### Title: Rcpp Exported Class Wrapping MUMPS library
### Aliases: Rcpp_Rmumps-class Rmumps solve.Rcpp_Rmumps solvet
###   solvet.Rcpp_Rmumps determinant.Rcpp_Rmumps dim.Rcpp_Rmumps
###   nrow.Rcpp_Rmumps ncol.Rcpp_Rmumps print.Rcpp_Rmumps show.Rcpp_Rmumps
### Keywords: classes

### ** Examples

 ## Not run: 
##D   # prepare random sparse matrix
##D   library(Matrix)
##D   library(rmumps)
##D   n=2000
##D   a=Matrix(0, n, n)
##D   set.seed(7)
##D   ij=sample(1:(n*n), 15*n)
##D   a[ij]=runif(ij)
##D   diag(a)=0
##D   diag(a)=-rowSums(a)
##D   a[1,1]=a[1,1]-1
##D   am=Rmumps$new(a)
##D   b=as.double(a%*%(1:n)) # rhs for an exact solution vector 1:n
##D   # following time includes symbolic analysis, LU factorization and system solving
##D   system.time(x<-solve(am, b))
##D   bb=2*b
##D   # this second time should be much shorter
##D   # as symbolic analysis and LU factorization are already done
##D   system.time(xx<-solve(am, bb))
##D   # compare to Matrix corresponding times
##D   system.time(xm<-solve(a, b))
##D   system.time(xxm<-solve(a, bb))
##D   # compare to Matrix precision
##D   range(x-1:n)  # mumps
##D   range(xm-1:n) # Matrix
##D 
##D   # matrix inversion
##D   system.time(aminv <- solve(am))
##D   system.time(ainv <- solve(a)) # the same in Matrix
##D   
##D   # symmetric matrix
##D   asy=as(a+t(a), "symmetricMatrix")
##D   bs=as.double(asy%*%(1:n)) # rhs for 1:n solution
##D   au=asy
##D   # Here, we keep only diagonal and upper values of asy matrix.
##D   # It could be also diagonal and lower values.
##D   au[row(au)>col(au)]=0
##D   ams=Rmumps$new(au, sym=1)
##D   system.time(xs<-solve(ams, bs)) # rmumps
##D   system.time(xsm<-solve(asy, bs))# Matrix
##D   # compare to Matrix precision
##D   range(xs-1:n)  # mumps
##D   range(xsm-1:n) # Matrix
##D 
##D   # clean up by hand to avoid possible interference between gc() and
##D   # Rcpp object destructor after unloading this namespace
##D   rm(am, ams)
##D   gc()
##D  
## End(Not run)



