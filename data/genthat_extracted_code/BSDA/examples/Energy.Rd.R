library(BSDA)


### Name: Energy
### Title: Amount of energy consumed by homes versus their sizes
### Aliases: Energy
### Keywords: datasets

### ** Examples


plot(kilowatt ~ size, data = Energy)
with(data = Energy, cor(size, kilowatt))
model <- lm(kilowatt ~ size, data = Energy)
plot(Energy$size, resid(model), xlab = "size")




