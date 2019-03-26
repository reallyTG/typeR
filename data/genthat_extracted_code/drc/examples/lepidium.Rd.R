library(drc)


### Name: lepidium
### Title: Dose-response profile of degradation of agrochemical using
###   lepidium
### Aliases: lepidium
### Keywords: datasets

### ** Examples


lepidium.m1 <- drm(weight~conc, data=lepidium, fct = LL.4())

modelFit(lepidium.m1)

plot(lepidium.m1, type = "all", log = "")



