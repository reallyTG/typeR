library(circular)


### Name: windrose
### Title: Windrose Generator
### Aliases: windrose
### Keywords: hplot

### ** Examples

# Random distribution of direction and magnitude in degrees

dir <- circular(runif(100, 0, 360), units="degrees")
mag <-  rgamma(100, 15)
sample <- data.frame(dir=dir, mag=mag)

par(mfrow=c(2,2))
res <- windrose(sample)
## we join two pedals and keep the same shrink (scale of the plot)
breaks <-circular(seq(0, 2 * pi, by = pi/6))
breaks <- breaks[-2]
windrose(sample, breaks=breaks, main="The same but with two pedals joined", 
  shrink=res$shrink)
## change the rotation
sample <- data.frame(dir=circular(dir, units="degrees", rotation="clock"), mag=mag)
windrose(sample, breaks=breaks, main="Change the rotation", shrink=res$shrink)
## use geographics template
sample <- data.frame(dir=circular(dir, units="degrees", template="geographics"),
  mag=mag)
windrose(sample, breaks=breaks, main="Use the template 'geographics'", 
  shrink=res$shrink)

## do the same plot but in radians
dir <- conversion.circular(dir)
windrose(x=dir, y=mag, xlim=c(-1.3, 1.3))

## magnify some part of the plot
windrose(x=dir, y=mag, xlim=c(0, 1.3))



