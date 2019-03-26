library(skyscapeR)


### Name: createHor
### Title: Create ._skyscapeR.horizon_ object from Az/Alt data
### Aliases: createHor

### ** Examples

# Create a skyscapeR.horizon from 5 measurements:
az <- c(0,90,180,270,360)
alt <- c(0,5,5,0,0)
hor <- createHor(az, alt, c(40.1,-8), 'Test')
plotHor(hor)



