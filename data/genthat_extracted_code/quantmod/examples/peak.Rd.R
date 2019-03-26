library(quantmod)


### Name: findPeaks
### Title: Find Peaks and Valleys In A Series
### Aliases: findPeaks findValleys peak valley
### Keywords: misc

### ** Examples

findPeaks(sin(1:10))

p <- findPeaks(sin(seq(1,10,.1)))
sin(seq(1,10,.1))[p]

plot(sin(seq(1,10,.1))[p])
plot(sin(seq(1,10,.1)),type='l')
points(p,sin(seq(1,10,.1))[p])



