library(nlsMicrobio)


### Name: ross
### Title: Secondary growth curves
### Aliases: ross
### Keywords: datasets

### ** Examples

data(ross)
def.par <- par(no.readonly = TRUE)
par(mfrow = c(2, 2))
plot(ross[c("T", "sqrtmumax")])
plot(ross[c("pH", "sqrtmumax")])
plot(ross[c("aw", "sqrtmumax")])
par(def.par)



