library(xpose4)


### Name: xpose.gam
### Title: Stepwise GAM search for covariates on a parameter (Xpose 4)
### Aliases: xpose.gam

### ** Examples

## Run a GAM using the example xpose database 
gam_ka <- xpose.gam(simpraz.xpdb, parnam="KA")

## Summarize GAM
xp.summary(gam_ka)

## GAM residuals of base model vs. covariates
xp.plot(gam_ka)

## An Akaike plot of the results
xp.akaike.plot(gam_ka)

## Studentized residuals
xp.ind.stud.res(gam_ka)

## Individual influence on GAM fit
xp.ind.inf.fit(gam_ka)

## Individual influence on GAM terms
xp.ind.inf.terms(gam_ka)

## Individual parameters to GAM fit
xp.cook(gam_ka)




