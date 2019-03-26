library(surveillance)


### Name: twinstim_iafplot
### Title: Plot the Spatial or Temporal Interaction Function of a
###   'twimstim'
### Aliases: iafplot
### Keywords: hplot aplot

### ** Examples

data("imdepifit")

iafplot(imdepifit, "tiaf", scaled=FALSE)   # tiaf.constant(), not very exciting
iafplot(imdepifit, "siaf", scaled=FALSE)

# scaled version uses a Monte-Carlo-CI
set.seed(1)  # result depends on .Random.seed
iafplot(imdepifit, "siaf", scaled=TRUE, conf.type="MC", conf.B=199,
        col.conf=gray(0.4), conf.level=NA)  # show MC samples



