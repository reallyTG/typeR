library(Hmisc)


### Name: multLines
### Title: Plot Multiple Lines
### Aliases: multLines
### Keywords: hplot

### ** Examples

x <- 1:4
y <- cbind(x, x-3, x-2, x-1, x+1, x+2, x+3)
plot(NA, NA, xlim=c(1,4), ylim=c(-2, 7))
multLines(x, y, col='blue')
multLines(x, y, col='red', pos='right')



