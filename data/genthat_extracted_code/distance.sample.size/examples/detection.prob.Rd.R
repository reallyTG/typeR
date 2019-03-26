library(distance.sample.size)


### Name: detection.prob
### Title: Calculate detection probabilities.
### Aliases: detection.prob

### ** Examples

dvalues <- seq(from=0,to=1,by=0.001)
dprobs <- detection.prob(d=dvalues,detection.function="hazard",theta=c(0.448,2))
plot(dvalues,dprobs,type="l",ylim=c(0,1))



