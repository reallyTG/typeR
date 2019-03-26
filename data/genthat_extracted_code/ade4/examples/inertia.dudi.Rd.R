library(ade4)


### Name: inertia.dudi
### Title: Decomposition of inertia (i.e. contributions) in multivariate
###   methods
### Aliases: inertia inertia.dudi print.inertia summary.inertia
### Keywords: multivariate

### ** Examples

data(housetasks)
coa1 <- dudi.coa(housetasks, scann = FALSE)
res <- inertia(coa1, col = TRUE, row = FALSE)
res
summary(res)



