library(BSDA)


### Name: Fluid
### Title: Breakdown times of an insulating fluid under various levels of
###   voltage stress
### Aliases: Fluid
### Keywords: datasets

### ** Examples


DF1 <- Fluid[Fluid$kilovolts == "34kV", ]
DF1
# OR
DF2 <- subset(Fluid, subset = kilovolts == "34kV")
DF2
stem(DF2$time)
SIGN.test(DF2$time)
## Not run: 
##D library(dplyr)
##D DF3 <- dplyr::filter(Fluid, kilovolts == "34kV") 
##D DF3
## End(Not run)




