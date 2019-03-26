library(enpls)


### Name: plot.cv.enpls
### Title: Plot cv.enpls object
### Aliases: plot.cv.enpls

### ** Examples

data("alkanes")
x = alkanes$x
y = alkanes$y

set.seed(42)
cvfit = cv.enpls(x, y, reptimes = 10)
plot(cvfit)



