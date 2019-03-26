library(RSiena)


### Name: includeInteraction
### Title: Function to create user-specified interactions for a Siena
###   model.
### Aliases: includeInteraction
### Keywords: classes

### ** Examples

mynet <- sienaDependent(array(c(s501, s502, s503), dim=c(50, 50, 3)))
alc <- varCovar(s50a)
mydata <- sienaDataCreate(mynet, alc)
myeff <- getEffects(mydata)
myeff <- includeEffects(myeff, transTrip)
myeff <- includeEffects(myeff, egoX, altX, simX, interaction1="alc")
myeff <- includeInteraction(myeff, recip, simX, interaction1=c("", "alc"))
myeff <- includeInteraction(myeff, transTrip, egoX, interaction1=c("", "alc"))
myeff
# How to set the effect parameter of an interaction:
myeff <- getEffects(mydata)
myeff <- setEffect(myeff, gwespFF, parameter=69)
myeff <- includeInteraction(myeff, recip, gwespFF, parameter=69)
myeff



