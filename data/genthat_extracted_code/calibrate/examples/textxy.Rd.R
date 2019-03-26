library(calibrate)


### Name: textxy
### Title: Nice placement of labels in a plot
### Aliases: textxy
### Keywords: aplot misc

### ** Examples

x <- rnorm(50)
y <- rnorm(50)
plot(x,y,asp=1)
textxy(x,y,1:50,m=c(mean(x),mean(y)))



