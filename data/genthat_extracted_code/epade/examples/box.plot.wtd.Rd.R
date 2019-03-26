library(epade)


### Name: box.plot.wtd
### Title: weighted Boxplot
### Aliases: box.plot.wtd
### Keywords: boxplot

### ** Examples

x<-rnorm(1000)
g<-round(runif(1000))
w<-abs(rnorm(1000))
d<- data.frame(x, g, w)
box.plot.wtd('x', 'g', w='w', data=d)



