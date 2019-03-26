library(PHYLOGR)


### Name: GarlandJanis.Original
### Title: Garland & Janis's 1993 data on mammalian running speed and limb
###   length
### Aliases: GarlandJanis.Original
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
##D # This data set can be prepared from the original pdi files
##D # (in directory Examples) as:
##D GarlandJanis.Orig <- read.pdi.data(c("49ms.pdi","49hmt.pdi"),
##D                    variable.names = c("body.mass", "running.speed",
##D                                       "hind.l.length","mtf.ratio")) 
##D Garland.Janis.Orig$clade <- as.factor(c(rep("Carnivore",19),
##D 				      rep("Herbivore",30)))
##D   
## End(Not run)







