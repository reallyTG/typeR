library(expm)


### Name: matStig
### Title: Stig's "infamous" Example Matrix
### Aliases: matStig
### Keywords: array datasets

### ** Examples

data(matStig)

as(matStig, "sparseMatrix") # since that prints more nicely.

## For more compact printing:
op <- options(digits = 4)

E1 <- expm(matStig, "Ward77", preconditioning="buggy") # the wrong result
as(E1, "sparseMatrix")
str(E2 <- expm(matStig, "Pade"))# the correct one (has "accuracy" attribute)
as(E2, "sparseMatrix")
attr(E2,"accuracy") <- NULL   # don't want it below
E3 <- expm(matStig, "R_Eigen")  # even that is fine here
all.equal(E1,E2) # not at all equal (rel.difference >~= 1.)
stopifnot(all.equal(E3,E2)) # ==

##________ The "proof" that "Ward77" is wrong _________
M <- matStig
Et1 <- expm(t(M), "Ward77", precond= "buggy")
Et2 <- expm(t(M), "Pade"); attr(Et2,"accuracy") <- NULL
all.equal(Et1, t(E1)) # completely different (rel.diff ~ 1.7 (platform dep.))
stopifnot(all.equal(Et2, t(E2))) # the same (up to tolerance)

options(op)



