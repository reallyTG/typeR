library(rcosmo)


### Name: summary.HPDataFrame
### Title: Summarise a 'HPDataFrame'
### Aliases: summary.HPDataFrame

### ** Examples

ns <- 2
hpdf <- HPDataFrame(I = rnorm(12*ns^2), nside = 2,
                    ordering = "nested")
win <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2))
hpdf.win <- window(hpdf, new.window = win)
summary(hpdf.win)




