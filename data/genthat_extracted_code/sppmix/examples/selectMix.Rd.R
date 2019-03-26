library(sppmix)


### Name: selectMix
### Title: Mixture Model Selection
### Aliases: selectMix

### ** Examples

## No test: 
# create the true mixture intensity surface
truesurf <- normmix(ps=c(.2, .6,.2), mus=list(c(0.3, 0.3), c(0.7, 0.7), c(0.5, 0.5)),
 sigmas = list(.01*diag(2), .01*diag(2), .01*diag(2)), lambda=100, win=spatstat::square(1))
plot(truesurf)
# generate the point pattern, truncate=TRUE by default
pp <- rsppmix(truesurf,truncate=FALSE)
plot(pp,mus=truesurf$mus)
# compute model selection criteria via an approximation that is not affected by label
# switching and will typically work well for large L
ModelSel=selectMix(pp,1:5,truncate=FALSE)
# show info
ModelSel
#generate the intensity surface randomly
truesurf <- rmixsurf(5,100,xlim = c(-3,3), ylim = c(-3,3), rand_m = TRUE)
truesurf
pp <- rsppmix(truesurf,truncate=FALSE)
ModelSel0=selectMix(pp,1:5,runallperms = 0, truncate=FALSE)
ModelSel1=selectMix(pp,1:5,runallperms = 1, truncate=FALSE)
ModelSel2=selectMix(pp,1:5,runallperms = 2, truncate=FALSE)
## End(No test)




