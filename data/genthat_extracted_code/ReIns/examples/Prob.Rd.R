library(ReIns)


### Name: Prob
### Title: Weissman estimator of small exceedance probabilities and large
###   return periods
### Aliases: Prob Return Weissman.p Weissman.r

### ** Examples

data(soa)

# Look at last 500 observations of SOA data
SOAdata <- sort(soa$size)[length(soa$size)-(0:499)]

# Hill estimator
H <- Hill(SOAdata)

# Exceedance probability
q <- 10^6
# Weissman estimator
Prob(SOAdata,gamma=H$gamma,q=q,plot=TRUE)

# Return period
q <- 10^6
# Weissman estimator
Return(SOAdata,gamma=H$gamma,q=q,plot=TRUE)



