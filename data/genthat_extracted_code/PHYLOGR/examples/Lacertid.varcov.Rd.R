library(PHYLOGR)


### Name: Lacertid.varcov
### Title: Variance-covariance matrix for lacertids from Bauwens and
###   Diaz-uriarte (1997)
### Aliases: Lacertid.varcov
### Keywords: datasets

### ** Examples

# a GLS fit
data(Lacertid.varcov)
data(Lacertid.Original)
ex.gls.phylog <-
phylog.gls.fit(Lacertid.Original$svl,Lacertid.Original$clutch.size,Lacertid.varcov)
ex.gls.phylog


## Not run: 
##D # This data can be obtained from the original dsc file as:
##D Lacertid.varcov <- read.phylog.matrix("ifsmi.dsc")
##D   
## End(Not run)






