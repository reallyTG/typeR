library(MIAmaxent)


### Name: plotFOP
### Title: Plot Frequency of Observed Presence (FOP).
### Aliases: plotFOP

### ** Examples

FOPev11 <- plotFOP(toydata_sp1po, 2)
FOPev12 <- plotFOP(toydata_sp1po, "EV12", intervals = 8)
FOPev12$EVoptimum
FOPev12$FOPdata

## Not run: 
##D # From vignette:
##D teraspifFOP <- plotFOP(grasslandPO, "teraspif")
##D terslpdgFOP <- plotFOP(grasslandPO, "terslpdg")
##D terslpdgFOP <- plotFOP(grasslandPO, "terslpdg", span = 0.75, intervals = 20)
##D terslpdgFOP
##D geobergFOP <- plotFOP(grasslandPO, 10)
##D geobergFOP
## End(Not run)




