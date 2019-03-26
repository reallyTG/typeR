library(extRemes)


### Name: damage
### Title: Hurricane Damage Data
### Aliases: damage
### Keywords: datasets

### ** Examples

data(damage)
plot( damage[,1], damage[,3], xlab="", ylab="Economic Damage", type="l", lwd=2)

# Fig. 3 of Katz (2002).
plot( damage[,"Year"], log( damage[,"Dam"]), xlab="Year", ylab="ln(Damage)", ylim=c(-10,5))

# Fig. 4 of Katz (2002).
qqnorm( log( damage[,"Dam"]), ylim=c(-10,5))



