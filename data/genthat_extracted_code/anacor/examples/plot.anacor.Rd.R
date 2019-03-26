library(anacor)


### Name: plot.anacor
### Title: Plots for anacor solution
### Aliases: plot.anacor screeplot.anacor screeplot
### Keywords: hplot

### ** Examples


## symmetric map
data(tocher)
res <- anacor(tocher)
plot(res, conf = NULL, main = "Symmetric Map")

## simple CA on Tocher data, asymmetric coordinates
res <- anacor(tocher, scaling = c("standard", "Benzecri"))
res

## Regression plots using Glass data
data(glass)
res <- anacor(glass)
plot(res, plot.type = "regplot", xlab = "fathers occupation", ylab = "sons occupation")


## Benzecri Plots for bitterling data
data(bitterling)
res1 <- anacor(bitterling, ndim = 2, scaling = c("Benzecri", "Benzecri"))
res2 <- anacor(bitterling, ndim = 5, scaling = c("Benzecri", "Benzecri"))
res2
plot(res1, plot.type = "benzplot", main = "Benzecri Distances (2D)")
plot(res2, plot.type = "benzplot", main = "Benzecri Distances (5D)")

## Column score plot,transformation plot, and ordination diagram for canonical CA
data(maxwell)
res <- anacor(maxwell$table, row.covariates = maxwell$row.covariates, 
scaling = c("Goodman", "Goodman"))
res
plot(res, plot.type = "colplot", xlim = c(-1.5,1), conf = NULL)
plot(res, plot.type = "transplot", legpos = "topright")
plot(res, plot.type = "orddiag")



