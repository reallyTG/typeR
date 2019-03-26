library(FieldSim)


### Name: setAtlas
### Title: Construct usual grids on some specific manifolds
### Aliases: setAtlas setAtlas,manifold-method setAtlas,process-method

### ** Examples

# Load FieldSim library
library(FieldSim)

# Example on the line manifold

line<-setManifold("line")
str(line)

setAtlas(line,"regular",200)
str(line)

#Example on the fractional Brownian motion

line.fBm<-setProcess("fBm-line",0.7)
str(line.fBm)

setAtlas(line.fBm,"regular",200)
str(line.fBm)

setAtlas(line.fBm,"random",100)
str(line.fBm)

setAtlas(line.fBm,"finer",9)
str(line.fBm)

setAtlas(line.fBm,"visualization",9)
str(line.fBm)




