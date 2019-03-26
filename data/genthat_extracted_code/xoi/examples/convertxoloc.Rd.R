library(xoi)


### Name: convertxoloc
### Title: Convert format of crossover locations data
### Aliases: convertxoloc
### Keywords: utilities

### ** Examples


data(bssbsb)

# crossover locations on chromosome 1
xoloc1 <- convertxoloc(find.breaks(bssbsb, chr=1))

# crossover locations on all chromosomes
xoloc <- convertxoloc(find.breaks(bssbsb))




