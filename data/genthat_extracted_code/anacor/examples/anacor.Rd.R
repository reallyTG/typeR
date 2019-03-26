library(anacor)


### Name: anacor
### Title: Simple and Canonical Correspondence Analysis
### Aliases: anacor print.anacor
### Keywords: models

### ** Examples


## simple CA on Tocher data, symmetric standard coordinates
data(tocher)
res <- anacor(tocher)
res

## simple CA on Tocher data, asymmetric coordinates
res <- anacor(tocher, scaling = c("standard", "Benzecri"))
res

## 2- and 5-dimensional solutions for bitterling data, Benzecri scaling
data(bitterling)
res1 <- anacor(bitterling, ndim = 2, scaling = c("Benzecri", "Benzecri"))
res2 <- anacor(bitterling, ndim = 5, scaling = c("Benzecri", "Benzecri"))
res1
res2

## Canonical CA on Maxwell data, Goodman scaling
data(maxwell)
res <- anacor(maxwell$table, row.covariates = maxwell$row.covariates, 
scaling = c("Goodman", "Goodman"))
res




