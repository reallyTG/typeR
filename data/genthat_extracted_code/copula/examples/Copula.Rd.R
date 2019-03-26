library(copula)


### Name: Copula
### Title: Density, Evaluation, and Random Number Generation for Copula
###   Functions
### Aliases: Copula dCopula pCopula rCopula dcopula pcopula rcopula
###   dCopula,matrix,claytonCopula-method dCopula,matrix,frankCopula-method
###   dCopula,matrix,gumbelCopula-method dCopula,matrix,normalCopula-method
###   dCopula,matrix,tCopula-method dCopula,matrix,galambosCopula-method
###   dCopula,matrix,amhCopula-method dCopula,matrix,joeCopula-method
###   dCopula,matrix,huslerReissCopula-method
###   dCopula,matrix,tawnCopula-method dCopula,matrix,tevCopula-method
###   dCopula,matrix,plackettCopula-method dCopula,matrix,fgmCopula-method
###   dCopula,matrix,moCopula-method dCopula,matrix,indepCopula-method
###   dCopula,matrix,fhCopula-method dCopula,matrix,empCopula-method
###   dCopula,matrix,khoudrajiBivCopula-method
###   dCopula,matrix,khoudrajiExplicitCopula-method
###   dCopula,matrix,rotCopula-method
###   dCopula,matrix,rotExplicitCopula-method
###   dCopula,matrix,mixCopula-method dCopula,numeric,claytonCopula-method
###   dCopula,numeric,frankCopula-method
###   dCopula,numeric,gumbelCopula-method
###   dCopula,numeric,normalCopula-method dCopula,numeric,tCopula-method
###   dCopula,numeric,galambosCopula-method
###   dCopula,numeric,amhCopula-method dCopula,numeric,joeCopula-method
###   dCopula,numeric,huslerReissCopula-method
###   dCopula,numeric,tawnCopula-method dCopula,numeric,tevCopula-method
###   dCopula,numeric,plackettCopula-method
###   dCopula,numeric,fgmCopula-method dCopula,numeric,moCopula-method
###   dCopula,numeric,indepCopula-method dCopula,numeric,fhCopula-method
###   dCopula,numeric,empCopula-method
###   dCopula,numeric,khoudrajiBivCopula-method
###   dCopula,numeric,khoudrajiExplicitCopula-method
###   dCopula,numeric,rotCopula-method dCopula,numeric,mixCopula-method
###   pCopula,matrix,claytonCopula-method pCopula,matrix,frankCopula-method
###   pCopula,matrix,gumbelCopula-method pCopula,matrix,normalCopula-method
###   pCopula,matrix,tCopula-method pCopula,matrix,galambosCopula-method
###   pCopula,matrix,amhCopula-method pCopula,matrix,joeCopula-method
###   pCopula,matrix,huslerReissCopula-method
###   pCopula,matrix,tawnCopula-method pCopula,matrix,tevCopula-method
###   pCopula,matrix,plackettCopula-method pCopula,matrix,fgmCopula-method
###   pCopula,matrix,moCopula-method pCopula,matrix,indepCopula-method
###   pCopula,matrix,lowfhCopula-method pCopula,matrix,upfhCopula-method
###   pCopula,matrix,empCopula-method pCopula,matrix,khoudrajiCopula-method
###   pCopula,matrix,rotCopula-method
###   pCopula,matrix,rotExplicitCopula-method
###   pCopula,matrix,mixCopula-method pCopula,numeric,claytonCopula-method
###   pCopula,numeric,frankCopula-method
###   pCopula,numeric,gumbelCopula-method
###   pCopula,numeric,normalCopula-method pCopula,numeric,tCopula-method
###   pCopula,numeric,galambosCopula-method
###   pCopula,numeric,amhCopula-method pCopula,numeric,joeCopula-method
###   pCopula,numeric,huslerReissCopula-method
###   pCopula,numeric,tawnCopula-method pCopula,numeric,tevCopula-method
###   pCopula,numeric,plackettCopula-method
###   pCopula,numeric,fgmCopula-method pCopula,numeric,moCopula-method
###   pCopula,numeric,indepCopula-method pCopula,numeric,lowfhCopula-method
###   pCopula,numeric,upfhCopula-method pCopula,numeric,empCopula-method
###   pCopula,numeric,khoudrajiCopula-method
###   pCopula,numeric,rotCopula-method pCopula,numeric,mixCopula-method
###   rCopula,numeric,claytonCopula-method
###   rCopula,numeric,frankCopula-method
###   rCopula,numeric,gumbelCopula-method
###   rCopula,numeric,normalCopula-method rCopula,numeric,tCopula-method
###   rCopula,numeric,galambosCopula-method
###   rCopula,numeric,amhCopula-method rCopula,numeric,joeCopula-method
###   rCopula,numeric,huslerReissCopula-method
###   rCopula,numeric,plackettCopula-method
###   rCopula,numeric,fgmCopula-method rCopula,numeric,moCopula-method
###   rCopula,numeric,evCopula-method rCopula,numeric,indepCopula-method
###   rCopula,numeric,lowfhCopula-method rCopula,numeric,upfhCopula-method
###   rCopula,numeric,empCopula-method
###   rCopula,numeric,khoudrajiCopula-method
###   rCopula,numeric,rotCopula-method rCopula,numeric,mixCopula-method
###   rCopula,numeric,nacopula-method
### Keywords: distribution multivariate

### ** Examples

norm.cop <- normalCopula(0.5)
norm.cop
## one d-vector =^= 1-row matrix, works too :
dCopula(c(0.5, 0.5), norm.cop)
pCopula(c(0.5, 0.5), norm.cop)

u <- rCopula(100, norm.cop)
plot(u)
dCopula(u, norm.cop)
pCopula(u, norm.cop)
persp  (norm.cop, dCopula)
contour(norm.cop, pCopula)

## a 3-dimensional normal copula
u <- rCopula(1000, normalCopula(0.5, dim = 3))
if(require(scatterplot3d))
  scatterplot3d(u)

## a 3-dimensional clayton copula
cl3 <- claytonCopula(2, dim = 3)
v <- rCopula(1000, cl3)
pairs(v)
if(require(scatterplot3d))
  scatterplot3d(v)

## Compare with the "nacopula" version :
fu1 <- dCopula(v, cl3)
fu2 <- copClayton@dacopula(v, theta = 2)
Fu1 <- pCopula(v, cl3)
Fu2 <- pCopula(v, onacopula("Clayton", C(2.0, 1:3)))
## The density and cumulative values are the same:
stopifnot(all.equal(fu1, fu2, tolerance= 1e-14),
          all.equal(Fu1, Fu2, tolerance= 1e-15))

## NA and "outside" u[]
u <- v[1:12,]
## replace some by values outside (0,1) and some by NA/NaN
u[1, 2:3] <- c(1.5, NaN); u[2, 1] <- 2; u[3, 1:2] <- c(NA, -1)
u[cbind(4:9, 1:3)] <- c(NA, NaN)
f <- dCopula(u, cl3)
cbind(u, f) # note: f(.) == 0 at [1] and [3] inspite of NaN/NA
stopifnot(f[1:3] == 0, is.na(f[4:9]), 0 < f[10:12])



