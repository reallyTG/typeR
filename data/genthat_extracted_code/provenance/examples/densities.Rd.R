library(provenance)


### Name: densities
### Title: A list of rock and mineral densities
### Aliases: densities

### ** Examples

data(Namib,densities)
N8 <- subset(Namib$HM,select="N8")
distribution <- minsorting(N8,densities,phi=2,sigmaphi=1,medium="air",by=0.05)
plot(distribution)



