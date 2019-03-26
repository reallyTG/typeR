library(qualityTools)


### Name: steepAscent
### Title: Steepest Ascent
### Aliases: steepAscent
### Keywords: design

### ** Examples

#Example from References
fdo = facDesign(k = 2, centerCube = 5)
lows(fdo) = c(170, 150)
highs(fdo) = c(230, 250)
names(fdo) = c("temperature", "time")
units(fdo) = c("C", "minutes")
yield = c(32.79, 24.07, 48.94, 52.49, 38.89, 48.29, 29.68, 46.5, 44.15)
response(fdo) = yield
summary(fdo)

sao = steepAscent(factors = c("B", "A"), response = "yield", size = 1,
                  data = fdo)
sao
obs.yield = c(NA, 56.2, 71.49, 75.63, 72.31, 72.10)
response(sao) = obs.yield
plot(sao, type = "b", col = 2, main = "Steepest Ascent")



