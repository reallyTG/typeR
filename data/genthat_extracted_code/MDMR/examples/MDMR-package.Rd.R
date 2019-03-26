library(MDMR)


### Name: MDMR-package
### Title: Multivariate Distance Matrix Regression
### Aliases: MDMR-package MDMR

### ** Examples

################################################################
## Conducting MDMR on data comprised of independent observations
################################################################
# Source data
data(mdmrdata)

# Get distance matrix
D <- dist(Y.mdmr, method = 'euclidean')

# Conduct MDMR
mdmr.res <- mdmr(X = X.mdmr, D = D)
summary(mdmr.res)

################################################################
## Conducting MDMR on data comprised of dependent observations
################################################################
# Source data
data("clustmdmrdata")

# Get distance matrix
D <- dist(Y.clust)

# Conduct mixed-MDMR
mixed.res <- mixed.mdmr(~ x1 + x2 + (x1 + x2 | grp),
                        data = X.clust, D = D)
summary(mixed.res)




