library(quantileDA)


### Name: ais
### Title: Australian Institute of Sport data
### Aliases: ais
### Keywords: datasets

### ** Examples

data(ais)
attach(ais)
pairs(ais[,c(3:4,10:13)], main = "AIS data")
plot(Wt~sport)



