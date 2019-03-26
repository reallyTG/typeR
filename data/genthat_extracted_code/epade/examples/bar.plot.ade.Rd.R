library(epade)


### Name: bar.plot.ade
### Title: Bar plot
### Aliases: bar.plot.ade
### Keywords: barplot

### ** Examples

x<- round(runif(1000, 0.5, 10.5))
bar.plot.ade(x, btext='Uniform distribution', gradient=TRUE)
x<-rbinom(1000, 1, 0.75)
y<-rbinom(1000, 1, 0.30)
z<-rbinom(1000, 1, 0.50)
bar.plot.ade(x,y,z)
bar.plot.ade(x,y,z, wall=4, form='c', main='Bar-Plot')



