library(oce)


### Name: oceColorsClosure
### Title: Create color functions
### Aliases: oceColorsClosure

### ** Examples

## Not run: 
##D ## Update oxygen color scheme to latest matplotlib value.
##D library(oce)
##D oxy <- "https://raw.githubusercontent.com/matplotlib/cmocean/master/cmocean/rgb/oxy-rgb.txt"
##D oxyrgb <- read.table(oxy, header=FALSE)
##D oceColorsOxygenUpdated <- oceColorsClosure(oxyrgb)
##D par(mfrow=c(1, 2))
##D m <- matrix(1:256)
##D imagep(m, col=oceColorsOxygen, zlab="oxygen")
##D imagep(m, col=oceColorsOxygenUpdated, zlab="oxygenUpdated")
## End(Not run)




