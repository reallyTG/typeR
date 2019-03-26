library(Flury)


### Name: steve
### Title: Steve's Basketball Data
### Aliases: steve
### Keywords: datasets

### ** Examples

data(steve)
## Not run: 
##D steve.glm <- glm(Hit.or.Miss ~ Distance, family = binomial, data =
##D steve)
##D plot(steve, main = "Steve's basketball data", pch = 16)
##D lines(steve$Distance, predict(steve.glm, type = "response"))
## End(Not run)



