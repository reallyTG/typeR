library(ctmm)


### Name: variogram
### Title: Calculate an empirical variogram from movement data
### Aliases: variogram

### ** Examples

#Load package and data
library(ctmm)
data(buffalo)

#Extract movement data for a single animal
Cilla <- buffalo$Cilla

#Calculate variogram
SVF <- variogram(Cilla)

#Plot the variogram with 50% and 95% CIs
plot(SVF,level=c(0.5,0.95))



