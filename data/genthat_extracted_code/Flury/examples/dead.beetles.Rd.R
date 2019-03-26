library(Flury)


### Name: dead.beetles
### Title: Beetle mortality data
### Aliases: dead.beetles
### Keywords: datasets

### ** Examples

data(dead.beetles)
## Not run: 
##D with(dead.beetles, plot(Dose, died / tested))
##D dead.glm <- glm(cbind(died, tested-died) ~ Dose, family = binomial, data = dead.beetles)
##D lines(dead.beetles$Dose, predict(dead.glm, type = "response"))
## End(Not run)



