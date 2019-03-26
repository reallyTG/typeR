library(highriskzone)


### Name: est_intens
### Title: Estimates the intensity of the point pattern.
### Aliases: est_intens

### ** Examples

data(craterA)
#change npixel = 50 to 1000 to get a nicer picture
spatstat::spatstat.options(npixel=50)
# use only ten observations for fast computation
thin.craterA <- craterA[1:10]
int <- est_intens(thin.craterA)
# Plot estimated intensity
plot(int$intensest, main = "pixel image of intensity")
plot(craterA$window, main = "contour plot of intensity")
contour(int$intensest, add =TRUE)



