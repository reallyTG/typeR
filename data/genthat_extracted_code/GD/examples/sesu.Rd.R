library(GD)


### Name: sesu
### Title: Comparison of size effects of spatial units.
### Aliases: sesu

### ** Examples

ndvilist <- list(ndvi_30, ndvi_40, ndvi_50)
su <- c(30,40,50) ## sizes of spatial units
gdlist <- list() ## list of all geographical detectors results
## set optional parameters of optimal discretization
## optional methods: equal, natural, quantile, geometric, sd and manual
discmethod <- c("equal","natural","quantile")
discitv <- c(4:6)
## "gdm" function
for (i in 1:length(su)){
  ndvidata <- ndvilist[[i]]
  gdlist[[i]] <- gdm(NDVIchange ~ Climatezone + Mining + Tempchange + GDP,
                     continuous_variable = c("Tempchange", "GDP"),
                     data = ndvidata,
                     discmethod = discmethod, discitv = discitv)
}
sesu(gdlist, su) ## size effects of spatial units




