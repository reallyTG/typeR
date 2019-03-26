library(pscl)


### Name: odTest
### Title: likelihood ratio test for over-dispersion in count data
### Aliases: odTest
### Keywords: regression

### ** Examples

data(bioChemists)
modelnb <- MASS::glm.nb(art ~ .,
                 data=bioChemists,
                 trace=TRUE)
odTest(modelnb)



