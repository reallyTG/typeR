library(renpow)


### Name: pow.work
### Title: Mechanical power and work
### Aliases: pow.work pow.work.plot
### Keywords: hplot dplot math

### ** Examples

t <- seq(0,60,0.1)
x <- pow.work(t,pow="const",p=2)
pow.work.plot(x)

x <- pow.work(t,pow="linear",p=0.025)
pow.work.plot(x)



