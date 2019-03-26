library(weights)


### Name: stdz
### Title: Standardizes any numerical vector, with weights.
### Aliases: stdz
### Keywords: ~standardize ~standardization ~weights

### ** Examples

test <- c(1,1,1,1,1,1,2,2,2,3,3,3,4,4)
weight <- c(.5,.5,.5,.5,.5,1,1,1,1,2,2,2,2,2)

summary(stdz(test))
summary(stdz(test, weight))
wtd.mean(stdz(test, weight), weight)
wtd.var(stdz(test, weight), weight)



