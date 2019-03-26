library(ProFit)


### Name: profitSersic
### Title: Sersic Profile Specific Functions
### Aliases: profitSersic profitCubaSersic profitRadialSersic Sersic sersic
### Keywords: cubature sersic

### ** Examples

## Not run: 
##D model = list(
##D   sersic = list(
##D     xcen = 10,
##D     ycen = 10,
##D     mag = 15,
##D     re = 2,
##D     nser = 4,
##D     ang = 30,
##D     axrat = 0.5,
##D     box = 0
##D 	)
##D )
##D 
##D dim=c(20,20)
##D 
##D tempExact=profitCubaSersic(xcen=model$sersic$xcen, ycen=model$sersic$ycen,
##D mag=model$sersic$mag, re=model$sersic$re, nser=model$sersic$nser, ang=model$sersic$ang,
##D axrat=model$sersic$axrat, box=model$sersic$box, dim=dim)
##D tempProFit=profitMakeModel(model, dim=dim)$z
##D 
##D #The relative differences between the exact and approximate ProFit model image.
##D #This is scaled to show 1% differences as extremes:
##D magimage((tempExact-tempProFit)/tempExact, magmap=FALSE, zlim=c(-0.01,0.01))
##D #They differ by no more the 1% in flux for any pixel, and in general much less than that:
##D hist((tempExact-tempProFit)/tempExact)
## End(Not run)



