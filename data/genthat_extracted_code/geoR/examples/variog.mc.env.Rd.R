library(geoR)


### Name: variog.mc.env
### Title: Envelops for Empirical Variograms Based on Permutation
### Aliases: variog.mc.env
### Keywords: spatial nonparametric

### ** Examples

s100.vario <- variog(s100, max.dist=1)
s100.env <- variog.mc.env(s100, obj.var = s100.vario)
plot(s100.vario, envelope = s100.env)



