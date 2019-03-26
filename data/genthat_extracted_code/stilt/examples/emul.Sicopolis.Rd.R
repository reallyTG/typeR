library(stilt)


### Name: emul.Sicopolis
### Title: SICOPOLIS ice sheet model emulator
### Aliases: emul.Sicopolis
### Keywords: datasets

### ** Examples

# Plot the response surface as a function of snow PDD factor, and ice
# PDD factor at year 2500 (time index 661), while keeping other parameters
# at mid-range values
data(emul.Sicopolis)
## Not run: 
##D   rsurface.plot(emul=emul.Sicopolis, parind=c(4,5), parvals=c(3, 10, 50, NA, NA),
##D       tind=661, n1=5, n2=5)
## End(Not run)



