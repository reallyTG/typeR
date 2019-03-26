library(ProTrackR)


### Name: plot
### Title: Plot a PTModule object
### Aliases: plot plot,PTModule,missing-method

### ** Examples

## get the example PTModule provided with the ProTrackR package
data("mod.intro")

## The most basic way to plot the module samples:
plot(mod.intro)

## By using xyplot arguments, we can make it look nicer:
plot(mod.intro, type = "l", layout = c(1,4),
     scales = list(x = list(relation = "free")))



