library(maps)


### Name: smooth.map
### Title: Smooth out aggregated data
### Aliases: smooth.map
### Keywords: dplot

### ** Examples

# compare to the example for match.map
data(state, package = "datasets")
data(votes.repub)
z = votes.repub[, "1900"]
m = map("state", fill = TRUE, plot = FALSE)
# use a small span to fill in, but not smooth, the data
# increase the resolution to get better results
fit = smooth.map(m, z, span = 1/100, merge = TRUE, ave = TRUE)
mat = tapply(fit$z, fit[1:2], mean)
gray.colors <- function(n) gray(rev(0:(n - 1))/n)
par(bg = "blue")
filled.contour(mat, color.palette = gray.colors, nlev = 32, asp = 1)
# another way to visualize:
image(mat, col = gray.colors(100))

# for a higher degree of smoothing:
# fit = smooth.map(m, z, merge = TRUE, ave = TRUE)
# interpolation, state averages are preserved:
# fit = smooth.map(m, z, merge = TRUE, ave = TRUE, type = "interp")



