library(rCAT)


### Name: trueCOGll
### Title: True centre of gravity from a set of Lat longs
### Aliases: trueCOGll

### ** Examples

lat <- runif (200,-24,-12)
long <- runif (200,43,51)
ll <- data.frame(lat,long)
cp <- trueCOGll(ll)



