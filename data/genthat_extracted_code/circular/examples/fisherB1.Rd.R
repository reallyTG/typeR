library(circular)


### Name: fisherB1
### Title: B.1 Arrival times at an intensive care unit
### Aliases: fisherB1 fisherB1c
### Keywords: datasets

### ** Examples

data(fisherB1c)
par(mfcol=c(1,2))
plot(fisherB1c, main="Clock 24", shrink=1.5)
plot(fisherB1c, template="clock12", main="Clock 12", shrink=1.5)



