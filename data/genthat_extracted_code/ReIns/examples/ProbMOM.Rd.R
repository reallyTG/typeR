library(ReIns)


### Name: ProbMOM
### Title: Estimator of small exceedance probabilities and large return
###   periods using MOM
### Aliases: ProbMOM ReturnMOM

### ** Examples

data(soa)

# Look at last 500 observations of SOA data
SOAdata <- sort(soa$size)[length(soa$size)-(0:499)]

# MOM estimator
M <- Moment(SOAdata)

# Exceedance probability
q <- 10^7
ProbMOM(SOAdata, gamma=M$gamma, q=q, plot=TRUE)

# Return period
q <- 10^7
ReturnMOM(SOAdata, gamma=M$gamma, q=q, plot=TRUE)



