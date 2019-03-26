library(LSD)


### Name: heatbarplot
### Title: Color a barplot.
### Aliases: LSD.heatbarplot heatbarplot
### Keywords: barplot

### ** Examples

points = 10^4
x = c(rnorm(points/2),rnorm(points/2)+4)
x = sign(x)*abs(x)^1.3
xhist = hist(x,plot = FALSE)

heatbarplot(xhist)



