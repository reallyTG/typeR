library(SiMRiv)


### Name: species
### Title: Create a species
### Aliases: species

### ** Examples

## example from 'simulate'

## note: perceptual range radii and step lengths must be
## adequate to the raster resolution!

LevyWalker <- species(
	(state.RW() * 100 + 10) + (state.CRW(0.97) * 500 + 20)
, transitionMatrix(0.005, 0.001))



