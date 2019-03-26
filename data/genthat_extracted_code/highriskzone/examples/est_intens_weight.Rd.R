library(highriskzone)


### Name: est_intens_weight
### Title: Estimates the intensity of the point pattern.
### Aliases: est_intens_weight

### ** Examples

data(craterA)
#change npixel = 50 to 1000 to get a nicer picture
spatstat::spatstat.options(npixel=50)
# use only ten observations for fast computation
thin.craterA <- craterA[1:10]
# weight first 5 observations twice
weights <- c(rep(2, 5), rep(1, 5))
int <- est_intens_weight(thin.craterA, weights = weights)
plot(int$intensest, main = "pixel image of intensity")
plot(craterA$window, main = "contour plot of intensity")
contour(int$intensest, add =TRUE)



