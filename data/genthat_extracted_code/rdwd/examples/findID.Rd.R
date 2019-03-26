library(rdwd)


### Name: findID
### Title: find DWD weather station ID from name
### Aliases: findID
### Keywords: character

### ** Examples

## Not run: 
##D # Give weather station name (must be existing in metaIndex):
##D findID("Potsdam")
##D findID("potsDam") # capitalization is ignored
##D # all names containing "Hamburg":
##D findID("Hamburg", exactmatch=FALSE)
##D findID("Potsdam", exactmatch=FALSE)
##D 
##D # vectorized:
##D findID(c("Potsdam","Berlin-Buch"))
##D 
##D # German Umlauts are changed to ue, ae, oe, ss
##D findID("Muenchen", FALSE)
##D berryFunctions::convertUmlaut("M?nchen") # use this to convert umlauts in lists
##D 
##D # See if warnings come as expected and are informative:
##D findID("this_is_not_a_city")
##D findID(c("Wuppertal"," this_is_not_a_city") )
##D 
##D findID()
##D findID(7777)
##D findID("01050")
##D 
## End(Not run)




