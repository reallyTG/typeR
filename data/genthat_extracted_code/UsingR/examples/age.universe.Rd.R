library(UsingR)


### Name: age.universe
### Title: Best estimate of the age of the universe
### Aliases: age.universe
### Keywords: datasets

### ** Examples

data(age.universe)
n <- nrow(age.universe)
x <- 1:n
names(x) = age.universe$year
plot(x,age.universe$upper,ylim=c(0,20))
points(x,age.universe$lower)
with(age.universe,sapply(x,function(i) lines(c(i,i),c(lower[i],upper[i]))))



