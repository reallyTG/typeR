library(tlm)


### Name: feld1
### Title: Cat Allergen Concentrations
### Aliases: feld1
### Keywords: datasets

### ** Examples

data(feld1)
par(las = 1, mfrow = c(1, 2))
with(feld1, plot(mattress, room, col = as.numeric(cat)))
with(feld1, plot(logmattress, logroom, col = as.numeric(cat)))



