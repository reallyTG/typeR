library(robcbi)


### Name: plot.fits.compare
### Title: Plots for comparing fits
### Aliases: plot.fits.compare
### Keywords: stats

### ** Examples

 library(robcbi)
 data(Finney)
 Vol <- Finney$Vol; Rate <- Finney$Rate; Resp <- Finney$Resp
 lVol <-log(Vol); lRate <- log(Rate)
 z.glm <- glm(Resp~lVol+lRate,family=binomial)
 z.cub <- glm(Resp~lVol+lRate,family=binomial,method="cubinf", ufact=3.2)
 comp <- fits.compare(z.glm,z.cub)
 comp
## Not run: 
##D  plot(comp)
## End(Not run)



