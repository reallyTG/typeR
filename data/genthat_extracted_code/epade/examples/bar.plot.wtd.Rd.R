library(epade)


### Name: bar.plot.wtd
### Title: weighted Bar plot
### Aliases: bar.plot.wtd
### Keywords: barplot

### ** Examples

x<-rbinom(1000, 1, 0.75)
y<-rbinom(1000, 1, 0.30)
z<-rbinom(1000, 1, 0.50)
w<-abs(rnorm(1000))
bar.plot.wtd(x,y,z, w)
bar.plot.wtd(x,y,z, w, wall=4, form='c', main='Bar-Plot')



