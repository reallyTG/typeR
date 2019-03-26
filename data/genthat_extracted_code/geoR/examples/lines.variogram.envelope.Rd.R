library(geoR)


### Name: lines.variogram.envelope
### Title: Adds Envelopes Lines to a Variogram Plot
### Aliases: lines.variogram.envelope
### Keywords: spatial aplot

### ** Examples

s100.vario <- variog(s100, max.dist = 1)
s100.ml <- likfit(s100, ini=c(.5, .5))
s100.mod.env <- variog.model.env(s100, obj.variog = s100.vario,
   model = s100.ml) 
s100.mc.env <- variog.mc.env(s100, obj.variog = s100.vario)
plot(s100.vario)
lines(s100.mod.env)
lines(s100.mc.env, lwd=2)




