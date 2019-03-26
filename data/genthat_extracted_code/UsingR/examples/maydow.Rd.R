library(UsingR)


### Name: maydow
### Title: Dow Jones industrial average and May maximum temperature
### Aliases: maydow
### Keywords: datasets

### ** Examples

data(maydow)
attach(maydow)
plot(max.temp,DJA)
plot(max.temp[-1],diff(DJA))



