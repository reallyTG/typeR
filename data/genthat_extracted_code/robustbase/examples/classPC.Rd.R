library(robustbase)


### Name: classPC
### Title: Compute Classical Principal Components via SVD or Eigen
### Aliases: classPC
### Keywords: multivariate

### ** Examples

set.seed(17)
x <- matrix(rnorm(120), 10, 12) # n < p {the unusual case}
pcx  <- classPC(x)
(k <- pcx$rank) # = 9  [after centering!]
pc2  <- classPC(x, scores=TRUE)
pcS  <- classPC(x, via.svd=TRUE)
all.equal(pcx, pcS, tol = 1e-8)
## TRUE: eigen() & svd() based PC are close here
pc0 <- classPC(x, center=FALSE, scale=TRUE)
pc0$rank # = 10  here *no* centering (as E[.] = 0)

## Loadings are orthnormal:
zapsmall( crossprod( pcx$loadings ) )

## PC Scores are roughly orthogonal:
S.S <- crossprod(pc2$scores)
print.table(signif(zapsmall(S.S), 3), zero.print=".")
stopifnot(all.equal(pcx$eigenvalues, diag(S.S)/k))

## the usual n > p case :
pc.x <- classPC(t(x))
pc.x$rank # = 10, full rank in the n > p case

cpc1 <- classPC(cbind(1:3)) # 1-D matrix
stopifnot(cpc1$rank == 1,
          all.equal(cpc1$eigenvalues, 1),
          all.equal(cpc1$loadings, 1))
## Don't show: 
stopifnot(classPC(x, center=FALSE)$rank == min(dim(x)))
ii <- names(pcx); ii <- ii[ii != "scores"]
stopifnot(all.equal(pcx[ii], pc2[ii], tol=0),
	  all.equal(pcx, pcS, tol=1e-8),
	  length(pc.x$center) == 10, identical(pc0$center, FALSE),
          all.equal(crossprod(pcx $loadings), diag(9)),
          all.equal(crossprod(pc.x$loadings), diag(10)),
          all.equal(colSums(abs(pcx$loadings)),
                    c(2.69035673, 2.78449399, 3.00148438,
                      2.9016688,  2.49400759, 2.90477204,
                      3.01639807, 2.4217181, 2.64665957)),
	  length(pc0$scale) == 12)
## End(Don't show)



