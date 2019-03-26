library(vegan)


### Name: MDSrotate
### Title: Rotate First MDS Dimension Parallel to an External Variable
### Aliases: MDSrotate
### Keywords: multivariate

### ** Examples

data(varespec)
data(varechem)
mod <- monoMDS(vegdist(varespec))
mod <- with(varechem, MDSrotate(mod, pH))
plot(mod)
ef <- envfit(mod ~ pH, varechem, permutations = 0)
plot(ef)
ordisurf(mod ~ pH, varechem, knots = 1, add = TRUE)



