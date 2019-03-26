library(ReIns)


### Name: QuantMOM
### Title: Estimator of extreme quantiles using MOM
### Aliases: QuantMOM

### ** Examples

data(soa)

# Look at last 500 observations of SOA data
SOAdata <- sort(soa$size)[length(soa$size)-(0:499)]

# MOM estimator
M <- Moment(SOAdata)

# Large quantile
p <- 10^(-5)
QuantMOM(SOAdata, p=p, gamma=M$gamma, plot=TRUE)



