library(metaviz)


### Name: viz_sunset
### Title: Sunset (power-enhanced) funnel plot
### Aliases: viz_sunset

### ** Examples

library(metaviz)
# Create a power-enhanced ("sunset") funnel plot using confidence and significance contours
viz_sunset(x = homeopath[, c("d", "se")], contours = TRUE)



