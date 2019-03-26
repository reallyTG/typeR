library(gets)


### Name: hpdata
### Title: Hoover and Perez (1999) data
### Aliases: hpdata
### Keywords: datasets Time Series Econometrics Financial Econometrics

### ** Examples

##load Hoover and Perez (1999) data:
data(hpdata)

##make quarterly data-matrix of zoo type:
newhpdata <- zooreg(hpdata[,-1], start=c(1959,1), frequency=4)

##plot data:
plot(newhpdata)

##transform data to log-differences in percent:
dloghpdata <- diff(log(newhpdata))*100

##plot log-differenced data:
plot(dloghpdata)




