library(gets)


### Name: infldata
### Title: Quarterly Norwegian year-on-year CPI inflation
### Aliases: infldata
### Keywords: datasets

### ** Examples

data(infldata)
infldata <- zooreg(infldata[,-1], frequency=4, start=c(1989,1))
plot(infldata[,"infl"])



