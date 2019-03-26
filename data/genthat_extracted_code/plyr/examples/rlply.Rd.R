library(plyr)


### Name: rlply
### Title: Replicate expression and return results in a list.
### Aliases: rlply
### Keywords: manip

### ** Examples

mods <- rlply(100, lm(y ~ x, data=data.frame(x=rnorm(100), y=rnorm(100))))
hist(laply(mods, function(x) summary(x)$r.squared))



