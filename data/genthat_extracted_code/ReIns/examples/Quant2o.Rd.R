library(ReIns)


### Name: Quant.2oQV
### Title: Second order refined Weissman estimator of extreme quantiles
###   (QV)
### Aliases: Quant.2oQV Weissman.q.2oQV

### ** Examples

data(soa)

# Look at last 500 observations of SOA data
SOAdata <- sort(soa$size)[length(soa$size)-(0:499)]

# Hill estimator
H <- Hill(SOAdata)
# Bias-reduced estimator (QV)
H_QV <- Hill.2oQV(SOAdata)

# Exceedance probability
p <- 10^(-5)
# Weissman estimator
Quant(SOAdata, gamma=H$gamma, p=p, plot=TRUE)

# Second order Weissman estimator (QV)
Quant.2oQV(SOAdata, gamma=H_QV$gamma, beta=H_QV$beta, b=H_QV$b, p=p,
           add=TRUE, lty=2)



