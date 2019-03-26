library(Flury)


### Name: snailsf
### Title: Aquatic snails hiding behaviour
### Aliases: snailsf
### Keywords: datasets

### ** Examples

data(snailsf)
## Not run: 
##D S <- sin(snailsf$Time * pi/12)
##D C <- cos(snailsf$Time * pi/12)
##D snail.glm <- glm(cbind(Found, Collected-Found) ~ Infected + C + S,
##D   family = binomial, data = snailsf)
##D summary(snail.glm)
## End(Not run)



