library(Flury)


### Name: basketball
### Title: Basketball Data
### Aliases: basketball
### Keywords: datasets

### ** Examples

data(basketball)
## Not run: 
##D bb <- glm(cbind(Andy, 6-Andy) ~ sqrt(Distance),
##D family = binomial, data = basketball)
##D with(basketball, (plot(Distance, Andy/6, main = "Andy's Success Rate") ))
##D lines(basketball$Distance, predict(bb, type = "response"))
## End(Not run)



