library(sads)


### Name: qqsad and qqrad methods
### Title: Quantile-quantile plots for species-abundance and rank-abundance
###   models
### Aliases: qqsad qqrad qqsad,fitsad-method qqsad,integer-method
###   qqsad,numeric-method qqsad,numeric,character,list,ANY,ANY-method
###   qqrad,fitrad-method qqrad,fitrad,missing,missing,missing-method
###   qqrad,integer-method qqrad,numeric-method
###   qqrad,numeric,character,list,ANY-method
###   qqrad,numeric,character,list,ANY,character-method qqrad,rad-method
###   qqrad,rad,character,list,ANY-method
###   qqrad,rad,character,list,ANY,character-method
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
qqsad(moths.ls)
qqsad(moths, sad="ls", coef=as.list(coef(moths.ls)))
qqsad(moths.ln)
qqsad(moths, sad="lnorm", coef=as.list(coef(moths.ln)), trunc=0.5)
par(mfrow=c(1,1))

## An example with RADs
data(okland)
## Fits broken-stick RAD model
ok.bs <- fitrad(okland, "rbs")
## Fits geometric series RAD model
ok.gs <- fitrad(okland, "gs")
## Plots with the model object and with the abundance vector 
par( mfrow=c(2, 2) )
qqrad(ok.bs)
qqrad(okland, rad="rbs", coef=as.list(coef(ok.bs)))
qqrad(ok.gs)
qqrad(okland, rad="gs", coef=as.list(coef(ok.gs)))
par(mfrow=c(1,1))



