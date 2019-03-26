library(letsR)


### Name: lets.addpoly
### Title: Add polygon coverage to a PresenceAbscence object
### Aliases: lets.addpoly

### ** Examples

## Not run: 
##D data(PAM)  # Phyllomedusa presence-absence matrix
##D require(maptools)
##D data(wrld_simpl)  # World map
##D Brazil <- wrld_simpl[wrld_simpl$NAME == "Brazil", ]  # Brazil (polygon)
##D 
##D # Check where is the variable name 
##D # (in this case it is in "NAME" which will be my z value)
##D names(Brazil)
##D 
##D PAM_pol <- lets.addpoly(PAM, Brazil, "NAME")
## End(Not run)




