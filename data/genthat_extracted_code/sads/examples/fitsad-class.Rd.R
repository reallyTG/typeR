library(sads)


### Name: fitsad-class
### Title: Class '"fitsad"' for maximum likelihood fitting of species
###   abundance distributions
### Aliases: fitsad-class plot,fitsad,ANY-method show,fitsad-method
###   ppsad,fitsad,missing,missing-method
###   ppsad,fitsad,missing,missing,missing-method
###   qqsad,fitsad,missing,missing,missing,missing-method
### Keywords: classes

### ** Examples

moths.ls <- fitsad(moths, "ls")
## The class has a plot method to show diagnostic plots
par(mfrow=c(2,2))
plot(moths.ls)
# the same plot, but with relative abundances
plot(moths.ls, prop = TRUE) 
par(mfrow=c(1,1))
## Some useful methods inherited from mle2-class
coef(moths.ls)
confint(moths.ls)
logLik(moths.ls)
## Model selection
moths.ln <- fitsad(moths, "lnorm", trunc=0.5)
AICctab(moths.ls, moths.ln, nobs=length(moths), base=TRUE)



