library(ReIns)


### Name: QuantGH
### Title: Estimator of extreme quantiles using generalised Hill
### Aliases: QuantGH

### ** Examples

data(soa)

# Look at last 500 observations of SOA data
SOAdata <- sort(soa$size)[length(soa$size)-(0:499)]

# Hill estimator
H <- Hill(SOAdata)
# Generalised Hill estimator
gH <- genHill(SOAdata, H$gamma)

# Large quantile
p <- 10^(-5)
QuantGH(SOAdata, p=p, gamma=gH$gamma, plot=TRUE)



