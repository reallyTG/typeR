library(trip)


### Name: as.Other
### Title: As ("trip", other-classes)
### Aliases: as.Other as.ppp.trip as.psp.trip explode

### ** Examples

## Not run: 
##D   ## Continuing the example from '?trip-methods:
##D utils::example("trip-methods", package="trip",
##D            ask=FALSE, echo=FALSE)
##D  as(tr, "ppp")
## End(Not run)
## Not run: 
##D  ## Continuing the example from '?trip-methods:
##D utils::example("trip-methods", package="trip",
##D            ask=FALSE, echo=FALSE)
##D  as.psp.trip(tr)
## End(Not run)
## Continuing the example from '?trip-methods:
utils::example("trip-methods", package="trip",
           ask=FALSE, echo=FALSE)
spldf <- explode(tr)
summary(tr)



