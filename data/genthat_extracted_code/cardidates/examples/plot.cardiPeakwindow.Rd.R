library(cardidates)


### Name: plot.cardiPeakwindow
### Title: Plot Method for cardiPeakwindow Objects
### Aliases: plot.cardiPeakwindow
### Keywords: hplot methods

### ** Examples

## generate artificial test data
set.seed(123)
x <- seq(1, 365 * 3, 18)
y <- rlnorm(x, sd = 0.6) +  5e-5 * exp(1e-4 * ((x - 100) %% 365)^2) +
                            1e-4 * exp(3e-4 * ((x - 220) %% 200)^2)

## identify peaks and mark first peak after a certain time x
peaks <- peakwindow(x, y, xstart = 55)

## plot it
plot(peaks)

# highlight peaks of other years
peaks2 <- peakwindow(x, y, xstart = 420)
peaks3 <- peakwindow(x, y, xstart = 785)
plot(peaks2, add = TRUE)
plot(peaks3, add = TRUE)

## mark years
abline(v = seq(0, 365 * 3, 365), col = "grey")



