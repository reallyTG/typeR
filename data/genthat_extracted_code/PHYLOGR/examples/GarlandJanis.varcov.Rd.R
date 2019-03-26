library(PHYLOGR)


### Name: GarlandJanis.varcov
### Title: Phylogenetic variance-covariance matrix for Garland & Janis
###   (1993).
### Aliases: GarlandJanis.varcov
### Keywords: datasets

### ** Examples


# an example of a GLS fit
data(GarlandJanis.Original)
data(GarlandJanis.varcov)
attach(GarlandJanis.Original)
fit.gls.GJ <- phylog.gls.fit(cbind(body.mass,hind.l.length),
running.speed, GarlandJanis.varcov)
summary(fit.gls.GJ) # summary of the gls model; same as with IC
detach(GarlandJanis.Original)



## Not run: 
##D # This data set can be obtained from the original dsc file as:
##D   
##D     GarlandJanis.varcov <- read.phylog.matrix("49ms.dsc")
##D 
##D 
## End(Not run)






