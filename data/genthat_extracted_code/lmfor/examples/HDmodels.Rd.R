library(lmfor)


### Name: HD models
### Title: Available 2- and 3- parameter H-D model functions to be used by
###   function 'fithd'.
### Aliases: HDnaslund HDmichailoff HDcurtis HDmeyer HDpower HDnaslund2
###   HDnaslund3 HDnaslund4 HDmicment HDmicment2 HDwykoff HDprodan
###   HDlogistic HDrichards HDweibull HDgomperz HDsibbesen HDkorf
###   HDratkowsky HDhossfeldIV startHDnaslund startHDmichailoff
###   startHDmeyer startHDpower startHDnaslund2 startHDnaslund3
###   startHDnaslund4 startHDmicment startHDmicment2 startHDwykoff
###   startHDcurtis startHDprodan startHDlogistic startHDrichards
###   startHDweibull startHDgomperz startHDsibbesen startHDkorf
###   startHDratkowsky startHDhossfeldIV startHDodels HDmodels
### Keywords: forest biometrics

### ** Examples

data(spati)
theta<-startHDnaslund(spati$d,spati$h)
plot(spati$d,spati$h)
d<-seq(0,50)
lines(d,HDnaslund(d,a=theta[1],b=theta[2]),col="red",lwd=5)



