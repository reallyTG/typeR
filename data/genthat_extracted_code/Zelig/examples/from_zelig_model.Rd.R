library(Zelig)


### Name: from_zelig_model
### Title: Extract the original fitted model object from a 'zelig'
###   estimation
### Aliases: from_zelig_model

### ** Examples

z5 <- zls$new()
z5$zelig(Fertility ~ Education, data = swiss)
from_zelig_model(z5)




