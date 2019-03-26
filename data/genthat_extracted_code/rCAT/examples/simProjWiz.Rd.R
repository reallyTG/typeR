library(rCAT)


### Name: simProjWiz
### Title: Simple Projection Wizard
### Aliases: simProjWiz

### ** Examples

lat <- runif (200,-24,-12)
long <- runif (200,43,51)
ll <- data.frame(lat,long)
cp <- trueCOGll(ll)
pointsprojected <- simProjWiz(ll,cp)



