library(qtl)


### Name: sim.map
### Title: Simulate a genetic map
### Aliases: sim.map
### Keywords: datagen

### ** Examples

# simulate 4 autosomes, each with 10 markers
map <- sim.map(c(100,90,80,40), 10, include.x=FALSE)
plotMap(map)

# equally spaced markers
map2 <- sim.map(c(100,90,80,40), 10, include.x=FALSE, eq.spacing=TRUE)
plot(map2)



