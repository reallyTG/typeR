library(rcosmo)


### Name: window.HPDataFrame
### Title: Get a sub window from a 'HPDataFrame'
### Aliases: window.HPDataFrame

### ** Examples

ns <- 16
hpdf <- HPDataFrame(nside = ns, I = 1:(12*ns^2))
hpdf

win1 <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2))
plot(hpdf); plot(win1)

hpdf.win <- window(hpdf, new.window = win1)
plot(hpdf.win, col = "yellow", size = 4, add = TRUE)
attributes(hpdf.win)
window(hpdf.win)
hpdf.win





