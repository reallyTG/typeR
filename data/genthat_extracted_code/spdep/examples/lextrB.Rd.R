library(spdep)


### Name: lextrB
### Title: Find extreme eigenvalues of binary symmetric spatial weights
### Aliases: lextrB lextrW lextrS l_max
### Keywords: spatial

### ** Examples

data(boston, package="spData")
ab.listb <- nb2listw(boston.soi, style="B")
er <- range(eigenw(ab.listb))
er
res_1 <- lextrB(ab.listb)
c(res_1)
#if (require(igraph)) {
#  B <- as(ab.listb, "symmetricMatrix")
#  n <- length(boston.soi)
#  f2 <- function(x, extra=NULL) {as.vector(B %*% x)}
#  ar1 <- arpack(f2, sym=TRUE, options=list(n=n, nev=1, ncv=8,
#    which="LA", maxiter=200))
#  print(ar1$values)
# At line 409 of file dsaupd.f: Fortran runtime error: Actual string
# length is shorter than the declared one for dummy argument 'which' (0/2)
#  arn <- arpack(f2, sym=TRUE, options=list(n=n, nev=1, ncv=8,
#    which="SA", maxiter=200))
#  print(arn$values)
# At line 409 of file dsaupd.f: Fortran runtime error: Actual string
# length is shorter than the declared one for dummy argument 'which' (0/2)
#  ar1 <- arpack(f2, sym=TRUE, options=list(n=n, nev=2, ncv=8,
#    which="BE", maxiter=300))
# "BE" gives: At line 558 of file dsaup2.f: Fortran runtime error: 
# Index '9' of dimension 1 of array 'bounds' above upper bound of 8
# "BE" 
#  print(ar1$values)
#}
k5 <- knn2nb(knearneigh(boston.utm, k=5))
c(l_max(nb2listw(k5, style="B")))
max(Re(eigenw(nb2listw(k5, style="B"))))
c(l_max(nb2listw(k5, style="C")))
max(Re(eigenw(nb2listw(k5, style="C"))))
ab.listw <- nb2listw(boston.soi, style="W")
er <- range(eigenw(similar.listw(ab.listw)))
er
res_1 <- lextrW(ab.listw)
c(res_1)
#if (require(igraph)) {
#  B <- as(similar.listw(ab.listw), "symmetricMatrix")
#  ar1 <- arpack(f2, sym=TRUE, options=list(n=n, nev=1, ncv=8,
#    which="LA", maxiter=400))
#  print(ar1$values)
# At line 409 of file dsaupd.f: Fortran runtime error: Actual string
# length is shorter than the declared one for dummy argument 'which' (0/2)
#  arn <- arpack(f2, sym=TRUE, options=list(n=n, nev=1, ncv=8,
#    which="SA", maxiter=400))
#  print(arn$values)
# At line 409 of file dsaupd.f: Fortran runtime error: Actual string
# length is shorter than the declared one for dummy argument 'which' (0/2)
#  ar1 <- arpack(f2, sym=TRUE, options=list(n=n, nev=2, ncv=8,
#    which="BE", maxiter=300))
# "BE" gives: At line 558 of file dsaup2.f: Fortran runtime error: 
# Index '9' of dimension 1 of array 'bounds' above upper bound of 8
#  print(ar1$values)
#}
## No test: 
ab.listw <- nb2listw(boston.soi, style="S")
er <- range(eigenw(similar.listw(ab.listw)))
er
res_1 <- lextrS(ab.listw)
c(res_1)
## End(No test)
#if (require(igraph)) {
#  B <- as(similar.listw(ab.listw), "symmetricMatrix")
#  ar1 <- arpack(f2, sym=TRUE, options=list(n=n, nev=1, ncv=8,
#    which="LA", maxiter=300))
#  print(ar1$values)
# At line 409 of file dsaupd.f: Fortran runtime error: Actual string
# length is shorter than the declared one for dummy argument 'which' (0/2)
#  arn <- arpack(f2, sym=TRUE, options=list(n=n, nev=1, ncv=8,
#    which="SA", maxiter=300))
#  print(arn$values)
# At line 409 of file dsaupd.f: Fortran runtime error: Actual string
# length is shorter than the declared one for dummy argument 'which' (0/2)
#  ar1 <- arpack(f2, sym=TRUE, options=list(n=n, nev=2, ncv=8,
#    which="BE", maxiter=300))
# "BE" gives: At line 558 of file dsaup2.f: Fortran runtime error: 
# Index '9' of dimension 1 of array 'bounds' above upper bound of 8
#  print(ar1$values)
#}



