library(ReIns)


### Name: trDTMLE
### Title: Truncation odds
### Aliases: trDTMLE

### ** Examples

# Sample from GPD truncated at 99% quantile
gamma <- 0.5
sigma <- 1.5
X <- rtgpd(n=250, gamma=gamma, sigma=sigma, endpoint=qgpd(0.99, gamma=gamma, sigma=sigma))

# Truncated ML estimator
trmle <- trMLE(X, plot=TRUE, ylim=c(0,2))

# Truncation odds
dtmle <- trDTMLE(X, gamma=trmle$gamma, tau=trmle$tau, plot=TRUE, ylim=c(0,0.05))



