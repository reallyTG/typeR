library(provenance)


### Name: read.densities
### Title: Read a .csv file with mineral and rock densities
### Aliases: read.densities

### ** Examples

data(Namib,densities)
N8 <- subset(Namib$HM,select="N8")
distribution <- minsorting(N8,densities,phi=2,sigmaphi=1,medium="air",by=0.05)
plot(distribution)



