library(seacarb)


### Name: kconv
### Title: Conversion factors to change the pH scale of dissociation
###   constants
### Aliases: kconv
### Keywords: utilities

### ** Examples

##To convert dissociation constants from the total scale to the free scale
## (at salinity=35, temperature=25oC and atmospheric pressure):
kconv(35,25,0)
conv <- kconv()
 c(K1_total=K1(),K1_SWS=K1()*conv$ktotal2SWS,K1_free=K1()*conv$ktotal2free)  



