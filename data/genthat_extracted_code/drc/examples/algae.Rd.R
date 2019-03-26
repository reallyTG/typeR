library(drc)


### Name: algae
### Title: Volume of algae as function of increasing concentrations of a
###   herbicide
### Aliases: algae
### Keywords: datasets

### ** Examples


algae.m1 <- drm(vol~conc, data=algae, fct=LL.3())
summary(algae.m1)

algae.m2 <- boxcox(algae.m1)
summary(algae.m2)




