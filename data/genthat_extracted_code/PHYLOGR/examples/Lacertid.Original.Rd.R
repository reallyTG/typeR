library(PHYLOGR)


### Name: Lacertid.Original
### Title: Bauwens and Diaz-Uriarte (1997) lacertid data
### Aliases: Lacertid.Original
### Keywords: datasets

### ** Examples

# a GLS fit
data(Lacertid.varcov)
data(Lacertid.Original)
ex.gls.phylog <-
phylog.gls.fit(Lacertid.Original$svl,Lacertid.Original$clutch.size,Lacertid.varcov)
ex.gls.phylog



## Not run: 
##D   # This data set can also be obtained from the pdi files
##D   # (see example in GarlandJanis.Original), or as:
##D 
##D LacertidSim <- read.sim.data(c("ifsmi.sim","ihshw.sim","iclag.sim","icfxx.sim"),
##D                   pdi.files=c("ifsmi.pdi","ihshw.pdi","iclag.pdi", "icfxx.pdi"),
##D 		  variable.names = c("svl","svl.matur","hatsvl","hatweight",
##D 		                    "clutch.size", "age.mat","cl.freq", "xx"))
##D 
##D LacertidSim <- LacertidSim[,-10]
##D LacertidOriginal <- LacertidSim[LacertidSim$sim.counter==0,-1]
##D   
## End(Not run)






