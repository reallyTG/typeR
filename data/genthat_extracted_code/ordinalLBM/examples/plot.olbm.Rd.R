library(ordinalLBM)


### Name: plot.olbm
### Title: Plot OLBM
### Aliases: plot.olbm

### ** Examples

data(olbm_dat)
res <- olbm(olbm_dat$Y, Q=3, L=2)   
plot(res, "hist")
plot(res, "incidence")



