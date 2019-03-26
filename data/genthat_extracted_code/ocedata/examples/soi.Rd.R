library(ocedata)


### Name: soi
### Title: Southern Oscillation Index
### Aliases: soi
### Keywords: datasets

### ** Examples

data(soi, package="ocedata")
recent <- subset(soi, year > 1950)
plot(recent$year, recent$index, type='l', xlab="Year", ylab="SOI")



