library(HoRM)


### Name: regressogram
### Title: Regressogram
### Aliases: regressogram
### Keywords: file

### ** Examples
 
## Regressogram for the natural gas dataset.

data(gas)

regressogram(x = gas$LA, y = gas$OK, nbins = 6, x.lab = "LA",
             y.lab = "OK", main = "Regressogram")




