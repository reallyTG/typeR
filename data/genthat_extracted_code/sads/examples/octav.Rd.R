library(sads)


### Name: octav-methods
### Title: Frequencies of species in octaves
### Aliases: octav octav,fitsad-method octav,fitrad-method
###   octav,numeric-method

### ** Examples

## BCI tree data
(bci.oc1 <- octav(bci, preston=TRUE))
## Comparing with standard class closure
par(mfrow=c(1,2))
plot(octav(bci), main="octav(bci, preston=FALSE)")
plot(bci.oc1, main="octav(bci, preston=TRUE)")
par(mfrow=c(1,1))



