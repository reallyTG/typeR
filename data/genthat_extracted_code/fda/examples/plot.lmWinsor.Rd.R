library(fda)


### Name: plot.lmWinsor
### Title: lmWinsor plot
### Aliases: plot.lmWinsor
### Keywords: hplot

### ** Examples

lm.1 <- lmWinsor(y1~x1, data=anscombe)
plot(lm.1)
plot(lm.1, xlim=c(0, 15), main="other title")

# list example
lm.1. <- lmWinsor(y1~x1, data=anscombe, trim=c(0, 0.25, .4, .5)) 
plot(lm.1.)




