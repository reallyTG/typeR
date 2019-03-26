library(surveillance)


### Name: stsplot_spacetime
### Title: Map of Disease Incidence
### Aliases: stsplot_spacetime
### Keywords: hplot dynamic spatial

### ** Examples

data("ha.sts")
print(ha.sts)

## map of total counts by district
plot(ha.sts, type=observed ~ 1 | unit)
## only show a sub-period total for two selected districts
plot(ha.sts[1:20,1:2], type=observed ~ 1 | unit)

## Not run: 
##D # space-time animation
##D plot(aggregate(ha.sts,nfreq=13), type= observed ~ 1 | unit * time)
##D 
##D #print the frames to a png device
##D #and do the animation without extra sleeping between frames
##D imgname <- file.path(tempdir(), "berlin")
##D plot(aggregate(ha.sts,nfreq=13), type = observed ~ 1 | unit * time,
##D      wait.ms=0, dev.printer=list(name=imgname))
##D 
##D #Use ImageMagick (you might have to adjust the path to 'convert')
##D system(paste0("convert -delay 50 ", imgname,
##D               "*.png ", imgname, "-animated.gif"))
## End(Not run)



