library(sads)


### Name: ppsad and pprad methods
### Title: Percentile-percentile plots for species-abundance and
###   rank-abundance models
### Aliases: ppsad pprad ppsad,fitsad-method ppsad,numeric-method
###   ppsad,numeric,character,list-method
###   ppsad,numeric,character,list,ANY-method pprad,fitrad-method
###   pprad,rad-method pprad,rad,character,list-method
###   pprad,rad,character,list,ANY,character-method
###   pprad,numeric,character,list,ANY,character-method
###   pprad,numeric-method pprad,numeric,character,list-method
### Keywords: methods

### ** Examples

## An example with SADs
data(moths)
## fits log-series distribution to abundance data
moths.ls <- fitsad(moths, "ls")
## fits lognormal distribution truncated at 0.5
moths.ln <- fitsad(moths,"lnorm", trunc=0.5)
## Plots with the model object and with abundance vector 
par(mfrow=c(2,2))
ppsad(moths.ls)
ppsad(moths, sad="ls", coef=as.list(coef(moths.ls)) )
ppsad(moths.ln)
ppsad(moths, sad="lnorm", coef=as.list(coef(moths.ln)), trunc=0.5)
par(mfrow=c(1,1))

## An example with RADs
data(okland)
## Fits broken-stick RAD model
ok.bs <- fitrad(okland, "rbs")
## Fits geometric series RAD model
ok.gs <- fitrad(okland, "gs")
## Plots with the model object and with the abundance vector 
par( mfrow=c(2, 2) )
pprad(ok.bs)
pprad(okland, rad="rbs", coef=as.list(coef(ok.bs)))
pprad(ok.gs)
pprad(okland, rad="gs", coef=as.list(coef(ok.gs)))
par(mfrow=c(1,1))



