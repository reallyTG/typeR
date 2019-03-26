library(control)


### Name: zpk
### Title: Create Zero-Pole-Gain Model.
### Aliases: zpk

### ** Examples

sys <- zpk(NULL, c(-1,-1), 1)
sys <- zpk(c(1,2), c(3,4), 5)
sys <- zpk(c(1,2), c(3+1i,4+2i), 5)

## Not run:   Access individual sys elements as 
sys$z
sys$p
sys$k




