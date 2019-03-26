library(copula)


### Name: corKendall
### Title: (Fast) Computation of Pairwise Kendall's Taus
### Aliases: corKendall

### ** Examples

## If there are no NA's, corKendall() is faster than cor(*, "kendall")
## and gives the same :

system.time(C1 <- cor(swiss, method="kendall"))
system.time(C2 <- corKendall(swiss))
stopifnot(all.equal(C1, C2,  tol = 1e-5))

## In the case of missing values (NA), corKendall() reverts to
## cor(*, "kendall", use = "pairwise") {no longer very fast} :

swM <- swiss # shorter names and three missings:
colnames(swM) <- abbreviate(colnames(swiss), min=6)
swM[1,2] <- swM[7,3] <- swM[25,5] <- NA
(C3 <- corKendall(swM)) # now automatically uses the same as
stopifnot(identical(C3, cor(swM, method="kendall", use="pairwise")))
## and is quite close to the non-missing "truth":
stopifnot(all.equal(unname(C3), unname(C2), tol = 0.06)) # rel.diff.= 0.055

try(corKendall(swM, checkNA=FALSE)) # --> Error
## the error is really from  pcaPP::cor.fk(swM)



