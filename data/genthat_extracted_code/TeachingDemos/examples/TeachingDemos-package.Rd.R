library(TeachingDemos)


### Name: TeachingDemos-package
### Title: Various functions for demonstration and learning.
### Aliases: TeachingDemos-package TeachingDemos
### Keywords: package aplot iplot dynamic

### ** Examples

ci.examp()

clt.examp()
clt.examp(5)

plot.dice( expand.grid(1:6,1:6), layout=c(6,6) )

faces(rbind(1:3,5:3,3:5,5:7))

plot(1:10, 1:10)
my.symbols( 1:10, 1:10, ms.polygram, n=1:10, inches=0.3 )

x <- seq(1,100)
y <- rnorm(100)
plot(x,y, type='b', col='blue')
clipplot( lines(x,y, type='b', col='red'), ylim=c(par('usr')[3],0))

power.examp()
power.examp(n=25)
power.examp(alpha=0.1)





