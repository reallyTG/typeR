library(Bolstad)


### Name: plot.Bolstad
### Title: Plot method for objects of type Bolstad
### Aliases: plot.Bolstad
### Keywords: plot

### ** Examples


x = rnorm(20,-0.5,1)
## find the posterior density with a N(0,1) prior on mu
b = normnp(x,sigma=1)
plot(b)
plot(b, which = 1:3)
plot(b, overlay = FALSE, which = 1:3)



