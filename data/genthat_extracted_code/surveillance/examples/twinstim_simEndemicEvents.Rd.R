library(surveillance)


### Name: twinstim_simEndemicEvents
### Title: Quick Simulation from an Endemic-Only 'twinstim'
### Aliases: simEndemicEvents
### Keywords: datagen models

### ** Examples

data("imdepi", "imdepifit")
load(system.file("shapes", "districtsD.RData", package="surveillance"))

## Fit an endemic-only twinstim()
m_noepi <- update(imdepifit, epidemic = ~0, siaf = NULL, model = TRUE)

## Simulate events from the above endemic model
set.seed(1)
s1 <- simEndemicEvents(m_noepi, tiles = districtsD)
class(s1)  # just a "SpatialPointsDataFrame"
summary(s1)
plot(s1, col = s1$type, cex = 0.5); plot(imdepi$W, lwd = 2, add = TRUE)

## Not run: 
##D ## the general simulation method takes several seconds
##D s0 <- simulate(m_noepi, seed = 1, data = imdepi, tiles = districtsD)
##D class(s0)  # gives a full "simEpidataCS" with several methods applicable
##D methods(class = "epidataCS")
##D plot(s0, "time")
##D plot(s0, "space", points.args = list(pch = 3), lwd = 2)
## End(Not run)



