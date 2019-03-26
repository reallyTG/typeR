library(sitar)


### Name: getPeakTrough
### Title: Identify peaks and troughs of curve
### Aliases: getPeakTrough

### ** Examples

## create mean height velocity curve
data(heights)
m1 <- sitar(age, height, id, heights, 4)
x <- getCovariate(m1)
y <- fitted(m1, level=0)
y <- predict(smooth.spline(x, y), x, deriv=1)$y

## and plot it
. <- order(x)
plot(y[.] ~ x[.], type='l', xlab='age', ylab='height')
points(t(getPeakTrough(x, y)), pch=17)
points(t(getPeakTrough(x, y, peak=FALSE)), pch=25)



