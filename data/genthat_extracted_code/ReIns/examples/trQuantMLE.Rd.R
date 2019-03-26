library(ReIns)


### Name: trQuantMLE
### Title: Estimator of large quantiles using truncated MLE
### Aliases: trQuantMLE

### ** Examples

# Sample from GPD truncated at 99% quantile
gamma <- 0.5
sigma <- 1.5
X <- rtgpd(n=250, gamma=gamma, sigma=sigma, endpoint=qgpd(0.99, gamma=gamma, sigma=sigma))

# Truncated ML estimator
trmle <- trMLE(X, plot=TRUE, ylim=c(0,2))

# Truncation odds
dtmle <- trDTMLE(X, gamma=trmle$gamma, tau=trmle$tau, plot=FALSE)

# Large quantile of X
trQuantMLE(X, gamma=trmle$gamma, tau=trmle$tau, DT=dtmle$DT, plot=TRUE, p=0.005, ylim=c(15,30))

# Large quantile of Y
trQuantMLE(X, gamma=trmle$gamma, tau=trmle$tau, DT=dtmle$DT, plot=TRUE, p=0.005, ylim=c(0,300), 
          Y=TRUE)



