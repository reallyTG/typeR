library(renpow)


### Name: panels plots
### Title: Plot utilities
### Aliases: panels.plots panels plot2yaxis
### Keywords: hplot dplot math

### ** Examples


wd=6; ht=3
panels(wd,ht,1,1,pty="m")
t <- seq(0,60,0.1)
x <- pow.work(t,pow="const",p=2)
pow.work.plot(x)

wd=7; ht=3.5
panels(wd,ht,1,2,pty="m")
# diode
V <- seq(-0.1,0.05,0.01) # volts
x <- diode(V)
ivplane(x)
V <- seq(-0.1,0.6,0.01) # volts
x <- diode(V)
ivplane(x)




