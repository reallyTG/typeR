library(geoR)


### Name: variog.model.env
### Title: Envelops for Empirical Variograms Based on Model Parameters
### Aliases: variog.model.env boot.variofit
### Keywords: spatial

### ** Examples

s100.ml <- likfit(s100, ini = c(0.5, 0.5), fix.nugget = TRUE)
s100.vario <- variog(s100, max.dist = 1)
s100.env <- variog.model.env(s100, obj.v = s100.vario,
                             model.pars = s100.ml)
plot(s100.vario, env = s100.env)



