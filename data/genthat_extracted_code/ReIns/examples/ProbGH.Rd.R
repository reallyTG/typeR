library(ReIns)


### Name: ProbGH
### Title: Estimator of small exceedance probabilities and large return
###   periods using generalised Hill
### Aliases: ProbGH ReturnGH

### ** Examples

data(soa)

# Look at last 500 observations of SOA data
SOAdata <- sort(soa$size)[length(soa$size)-(0:499)]

# Hill estimator
H <- Hill(SOAdata)
# Generalised Hill estimator
gH <- genHill(SOAdata, H$gamma)

# Exceedance probability
q <- 10^7
ProbGH(SOAdata, gamma=gH$gamma, q=q, plot=TRUE)

# Return period
q <- 10^7
ReturnGH(SOAdata, gamma=gH$gamma, q=q, plot=TRUE)



