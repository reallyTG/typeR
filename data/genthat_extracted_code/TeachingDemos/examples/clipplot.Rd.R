library(TeachingDemos)


### Name: clipplot
### Title: Clip plotting to a rectangular region
### Aliases: clipplot
### Keywords: aplot dplot

### ** Examples

x <- seq(1,100)
y <- rnorm(100)
plot(x,y, type='b', col='blue')
clipplot( lines(x,y, type='b', col='red'), ylim=c(par('usr')[3],0))


attach(iris)

tmp <- c('red','green','blue')
names(tmp) <- levels(Species)
plot(Petal.Width,Petal.Length, col=tmp[Species])
for(s in levels(Species)){
  clipplot( abline(
    lm(Petal.Length~Petal.Width, data=iris, subset=Species==s),
    col=tmp[s]),
    xlim=range(Petal.Width[Species==s]))
}

detach(iris)




