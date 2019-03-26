library(skyscapeR)


### Name: star.phases
### Title: Calculate the seasons and phases of a star
### Aliases: star.phases

### ** Examples

## Not run: 
##D ss1 <- star.phases('Aldebaran',-4000, c(35,-8))
##D 
##D # One can then look at the star's phase:
##D ss1$phase
##D 
##D # Date range of seasons:
##D ss1$seasons
##D 
##D # Date range of events/phases:
##D ss1$events
##D 
##D # And plot them:
##D plotPhases(ss1)
##D 
##D # You can play with the parameters and see how predictions change:
##D ss1 <- star.phases('Aldebaran',-4000, c(35,-8), alt.hor=2, alt.rs=5)
##D plotPhases(ss1)
## End(Not run)



