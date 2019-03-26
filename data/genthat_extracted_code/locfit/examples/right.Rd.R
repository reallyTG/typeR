library(locfit)


### Name: right
### Title: One-sided right smooth for a Locfit model.
### Aliases: right
### Keywords: models

### ** Examples

# compute left and right smooths
data(penny)
xev <- (1945:1988)+0.5
fitl <- locfit(thickness~left(year,h=10,deg=1), ev=xev, data=penny)
fitr <- locfit(thickness~right(year, h=10, deg=1), ev=xev, data=penny)
# plot the squared difference, to show the change points.
plot( xev, (predict(fitr, where="ev") - predict(fitl, where="ev"))^2 )



