library(metafor)


### Name: baujat
### Title: Baujat Plots for 'rma' Objects
### Aliases: baujat baujat.rma
### Keywords: hplot

### ** Examples

### load data from Pignon et al. (2000)
dat <- get(data(dat.pignon2000))

### compute estimated log hazard ratios and sampling variances
dat$yi <- with(dat, OmE/V)
dat$vi <- with(dat, 1/V)

### meta-analysis based on all 65 trials
res <- rma(yi, vi, data=dat, method="FE", slab=trial)

### create Baujat plot
baujat(res)

### some variations of the plotting symbol
baujat(res, symbol=19)
baujat(res, symbol="slab")



