library(jocre)


### Name: wires
### Title: Quality control study of wire connections
### Aliases: wires
### Keywords: datasets

### ** Examples

## Not run: 
##D data(wires)
##D 
##D # Simultaneous 90% confidence regions for the mean and variance
##D plot(csetMV(wires$Strength, method="mood"), main="Mood")
##D plot(csetMV(wires$Strength, method="lrt"), main="LRT")
## End(Not run)



