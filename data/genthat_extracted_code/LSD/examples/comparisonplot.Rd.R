library(LSD)


### Name: comparisonplot
### Title: Comparisonplot: a fancy scatterplot
### Aliases: comparisonplot cplot
### Keywords: barplot scatterplot,

### ** Examples

points = 10^4
x = c(rnorm(points/2),rnorm(points/2)+4)
y = x + rnorm(points,sd=0.8)
x = sign(x)*abs(x)^1.3

comparisonplot(x,y,histbreaks=30,pch=20)



