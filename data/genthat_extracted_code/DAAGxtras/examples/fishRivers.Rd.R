library(DAAGxtras)


### Name: fishRivers
### Title: Characteristics of river reference sites
### Aliases: fishRivers
### Keywords: datasets

### ** Examples

data(fishRivers)
library(MASS)
fish.lda <- lda(Group ~ Avrain + Dis +Elev + Lat + Long + Slope,
               data=fishRivers)



