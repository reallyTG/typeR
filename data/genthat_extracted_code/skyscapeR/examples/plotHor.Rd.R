library(skyscapeR)


### Name: plotHor
### Title: Plot horizon data
### Aliases: plotHor

### ** Examples

# Plot a horizon retrieved from HeyWhatsThat:
hor <- download.HWT('HIFVTBGK')
plotHor(hor)

# Add the paths of the solstices and equinoxes sun in the year 1999 BC:
tt <- sky.objects('sun', -2000, 'blue')
plotHor(hor, objects=tt)



