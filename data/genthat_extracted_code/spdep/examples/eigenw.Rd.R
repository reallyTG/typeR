library(spdep)


### Name: eigenw
### Title: Spatial weights matrix eigenvalues
### Aliases: eigenw griffith_sone subgraph_eigenw
### Keywords: spatial

### ** Examples

data(oldcol)
W.eig <- eigenw(nb2listw(COL.nb, style="W"))
1/range(W.eig)
S.eig <- eigenw(nb2listw(COL.nb, style="S"))
1/range(S.eig)
B.eig <- eigenw(nb2listw(COL.nb, style="B"))
1/range(B.eig)
# cases for intrinsically asymmetric weights
crds <- cbind(COL.OLD$X, COL.OLD$Y)
k3 <- knn2nb(knearneigh(crds, k=3))
is.symmetric.nb(k3)
k3eig <- eigenw(nb2listw(k3, style="W"))
is.complex(k3eig)
rho <- 0.5
Jc <- sum(log(1 - rho * k3eig))
# complex eigenvalue Jacobian
Jc
# subgraphs
nc <- n.comp.nb(k3)
nc$nc
table(nc$comp.id)
k3eigSG <- subgraph_eigenw(k3, style="W")
all.equal(sort(k3eig), k3eigSG)
W <- as(nb2listw(k3, style="W"), "CsparseMatrix")
I <- diag(length(k3))
Jl <- sum(log(abs(diag(slot(lu(I - rho * W), "U")))))
# LU Jacobian equals complex eigenvalue Jacobian
Jl
all.equal(Re(Jc), Jl)
# wrong value if only real part used
Jr <- sum(log(1 - rho * Re(k3eig)))
Jr
all.equal(Jr, Jl)
# construction of Jacobian from complex conjugate pairs (Jan Hauke)
Rev <- Re(k3eig)[which(Im(k3eig) == 0)]
# real eigenvalues
Cev <- k3eig[which(Im(k3eig) != 0)]
pCev <- Cev[Im(Cev) > 0]
# separate complex conjugate pairs
RpCev <- Re(pCev)
IpCev <- Im(pCev)
# reassemble Jacobian
Jc1 <- sum(log(1 - rho*Rev)) + sum(log((1 - rho * RpCev)^2 + (rho^2)*(IpCev^2)))
all.equal(Re(Jc), Jc1)
# impact of omitted complex part term in real part only Jacobian
Jc2 <- sum(log(1 - rho*Rev)) + sum(log((1 - rho * RpCev)^2))
all.equal(Jr, Jc2)
# trace of asymmetric (WW) and crossprod of complex eigenvalues for APLE
sum(diag(W %*% W))
crossprod(k3eig)
# analytical regular grid eigenvalues
rg <- cell2nb(ncol=7, nrow=7, type="rook")
rg_eig <- eigenw(nb2listw(rg, style="B"))
rg_GS <- griffith_sone(P=7, Q=7, type="rook")
all.equal(rg_eig, rg_GS)
## No test: 
if (require(igraph)) {
B <- as(nb2listw(rg, style="B"), "CsparseMatrix")
f <- function(x, extra=NULL) {as.vector(B %*% x)}
res1 <- arpack(f, sym=TRUE, options=list(n=nrow(B), nev=1, ncv=8, which="LA",
 maxiter=200))
resn <- arpack(f, sym=TRUE, options=list(n=nrow(B), nev=1, ncv=8, which="SA", maxiter=200))
print(c(resn$value, res1$value))
#res <- arpack(f, sym=TRUE, options=list(n=nrow(B), nev=2, ncv=8, which="BE",
# maxiter=200))
#print(res$value)
# At line 558 of file dsaup2.f: Fortran runtime error:
# Index '9' of dimension 1 of array 'bounds' above upper bound of 8
print(all.equal(range(Re(rg_eig)), c(resn$value, res1$value)))
lw <- nb2listw(rg, style="W")
rg_eig <- eigenw(similar.listw(lw))
print(range(Re(rg_eig)))
W  <- as(lw, "CsparseMatrix")
f <- function(x, extra=NULL) {as.vector(W %*% x)}
print(arpack(f, sym=FALSE, options=list(n=nrow(W), nev=1, ncv=8, which="LR",
 maxiter=200))$value)
print(arpack(f, sym=FALSE, options=list(n=nrow(W), nev=1, ncv=8, which="SR",
 maxiter=200))$value)
}
## End(No test)



