library(TLMoments)


### Name: summary.PWMs
### Title: Summary PWMs
### Aliases: summary.PWMs

### ** Examples

x <- cbind(rgev(100, shape = .2), rgev(100, shape = .2))

summary(PWMs(x[, 1]))
summary(PWMs(x[, 1]), distr = "gev")
summary(PWMs(x[, 1]), distr = "gev", select = 1:2)

summary(PWMs(x))
summary(PWMs(x), select = 1:2)

## Not run: 
##D summary(as.PWMs(c(15, 4, .5)))
## End(Not run)



