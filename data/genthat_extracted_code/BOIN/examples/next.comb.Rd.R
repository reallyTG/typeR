library(BOIN)


### Name: next.comb
### Title: Determine the dose combination for the next cohort of new
###   patients for drug-combination trials that aim to find a MTD
### Aliases: next.comb

### ** Examples


## determine the dose combination for the next cohort of new patients
n <- matrix(c(3, 0, 0, 0, 0, 7, 6, 0, 0, 0, 0, 0, 0, 0, 0), ncol=5, byrow=TRUE)
y <- matrix(c(0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0), ncol=5, byrow=TRUE)
nxt.comb <- next.comb(target=0.3, npts=n, ntox=y, dose.curr=c(2, 2))
summary.boin(nxt.comb)





