library(ctmm)


### Name: variogram.fit
### Title: Visually fit a movement model to a variogram
### Aliases: ctmm.guess variogram.fit

### ** Examples

#Load package and data
library(ctmm)
data(buffalo)

#Extract movement data for a single animal
Cilla <- buffalo$Cilla

#Calculate variogram
SVF <- variogram(Cilla)

# generate a visual fit of the variogram (requires RStudio or a guess object is returned)
variogram.fit(SVF)



