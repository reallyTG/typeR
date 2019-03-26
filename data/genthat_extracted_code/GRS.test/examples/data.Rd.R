library(GRS.test)


### Name: data
### Title: Fama-French Data: 25 size-B/M portfolio and risk factors,
###   obtained from French's library
### Aliases: data
### Keywords: datasets

### ** Examples

data(data)
y=ts(data[,2],frequency=12,start=c(1950,1))
plot.ts(y)



