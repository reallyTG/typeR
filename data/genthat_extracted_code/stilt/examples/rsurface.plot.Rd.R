library(stilt)


### Name: rsurface.plot
### Title: To produce a response surface plot of the emulator
### Aliases: rsurface.plot

### ** Examples

# Plot the SICOPOLIS ice mass loss in year 2500 as a function of Snow
# PDD Factor and Ice PDD Factor, at mid-range values of other parameters
data(emul.Sicopolis)
## Not run: 
##D   rsurface.plot(emul=emul.Sicopolis, parind=c(4,5), parvals=c(3, 10, 50, NA, NA),
##D       tind=661, n1=5, n2=5)
##D   
## End(Not run)



