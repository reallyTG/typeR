library(evidence)


### Name: BirdsCS
### Title: Simulated clutch size data for birds with different nesting
###   locations.
### Aliases: BirdsCS
### Keywords: datasets

### ** Examples

data(BirdsCS)
library(graphics)
coplot(ClutchSize ~ Inc.Per | Nest, BirdsCS, panel=panel.smooth)



