library(UsingR)


### Name: central.park
### Title: Weather in Central Park NY in May 2003
### Aliases: central.park
### Keywords: datasets

### ** Examples

data(central.park)
attach(central.park)
barplot(rbind(MIN,MAX-MIN),ylim=c(0,80))



