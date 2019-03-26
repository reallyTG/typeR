library(LSTS)


### Name: LS.whittle
### Title: Whittle estimator to Locally Stationary Time Series
### Aliases: LS.whittle whittle estimator
### Keywords: whittle loglik estimator timeseries

### ** Examples

## Require "rdatamarket"
library(rdatamarket)
malleco = dmlist("22tn")
y = malleco$Value

# Analysis by blocks of phi and sigma parameters
T. = length(y)
N = 200
S = 100
M = trunc((T. - N)/S + 1)
table = c()
for(j in 1:M){
x = y[(1 + S*(j-1)):(N + S*(j-1))]
table = rbind(table,nlminb(start = c(0.65, 0.15), N = N, objective = LS.whittle.loglik,
                           series = x, order = c(p = 1, q = 0))$par)
}
u = (N/2 + S*(1:M-1))/T.
table = as.data.frame(cbind(u, table))
colnames(table) = c("u", "phi", "sigma")

spar = 0.6
## start parameters
phi = smooth.spline(table$phi, spar = spar)$y
fit.1 = nls(phi ~ a0+a1*u, start = list(a0 = 0.65, a1 = 0.00))
sigma = smooth.spline(table$sigma, spar = spar)$y
fit.2 = nls(sigma ~ b0+b1*u, start = list(b0 = 0.65, b1 = 0.00))

fit = LS.whittle(series = y, start = c(coef(fit.1), coef(fit.2)), order = c(p = 1, q = 0),
                 ar.order = c(1), sd.order = 1, N = 180, n.ahead = 10)

names(fit)
fit$coef
fit$loglik



