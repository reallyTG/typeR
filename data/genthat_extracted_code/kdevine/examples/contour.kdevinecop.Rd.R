library(kdevine)


### Name: contour.kdevinecop
### Title: Contour plots of pair copula kernel estimates
### Aliases: contour.kdevinecop

### ** Examples

data(wdbc, package = "kdecopula")                     # load data
u <- VineCopula::pobs(wdbc[, 5:7], ties = "average")  # rank-transform
## Don't show: 
wdbc <- wdbc[1:30, ]
## End(Don't show)
# estimate density
fit <- kdevinecop(u)

# contour matrix
contour(fit)




