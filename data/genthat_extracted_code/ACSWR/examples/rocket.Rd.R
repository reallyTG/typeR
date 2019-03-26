library(ACSWR)


### Name: rocket
### Title: Rocket Propellant
### Aliases: rocket
### Keywords: latin square design

### ** Examples

data(rocket)
matrix(rocket$treat,nrow=5)
par(mfrow=c(1,3))
plot(y~factor(op)+factor(batch)+treat,rocket)
rocket_aov <- aov(y~factor(op)+factor(batch)+treat,rocket)



