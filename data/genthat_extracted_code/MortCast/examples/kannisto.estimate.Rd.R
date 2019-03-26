library(MortCast)


### Name: kannisto.estimate
### Title: Kannisto Estimation
### Aliases: kannisto.estimate

### ** Examples

data(mxM, package = "wpp2017")
mx <- subset(mxM, name == "Canada")[,"2010-2015"]
kannisto.estimate(mx[18:21], ages = 18:21)




