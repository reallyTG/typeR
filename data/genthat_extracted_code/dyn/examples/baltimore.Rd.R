library(dyn)


### Name: baltimore
### Title: Baltimore energy data
### Aliases: baltimore
### Keywords: datasets

### ** Examples

library(lattice)
data(baltimore)
xyplot(baltimore)
cor(baltimore)
xyplot(elect + gas ~ temp, 
	data = as.data.frame(baltimore), pch = 20, auto.key = TRUE)



