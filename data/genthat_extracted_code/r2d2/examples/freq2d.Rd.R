library(r2d2)


### Name: freq2d
### Title: Bivariate (Two-Dimensional) Frequency Distribution
### Aliases: freq2d freq2d.default freq2d.formula
### Keywords: dplot manip distribution multivariate

### ** Examples

freq2d(Ushape)
freq2d(quakes$long, quakes$lat, dnn="")
freq2d(lat~long, quakes, n=c(10,20), pad=1)

# Supress display
freq2d(saithe)
range(freq2d(saithe, print=FALSE))

# Layout, plot
freq2d(saithe, layout=2)
freq2d(saithe, layout=3)
contour(freq2d(saithe, layout=2))
lattice::contourplot(Freq~Bio+HR, freq2d(saithe,layout=3))



