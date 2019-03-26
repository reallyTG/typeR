library(ACSWR)


### Name: rocket_Graeco
### Title: Rocket Propellant Example Extended
### Aliases: rocket_Graeco
### Keywords: Graeco Latin square design

### ** Examples

data(rocket_Graeco)
plot(y~op+batch+treat+assembly,rocket_Graeco)
rocket.glsd.aov <- aov(y~factor(op)+factor(batch)+treat+assembly,rocket_Graeco)
summary(rocket.glsd.aov)



