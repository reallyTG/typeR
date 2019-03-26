library(bssm)


### Name: svm
### Title: Stochastic Volatility Model
### Aliases: svm

### ** Examples


data("exchange")
exchange <- exchange[1:100] # faster CRAN check
model <- svm(exchange, rho = uniform(0.98,-0.999,0.999),
 sd_ar = halfnormal(0.15, 5), sigma = halfnormal(0.6, 2))

obj <- function(pars) {
   -logLik(svm(exchange, rho = uniform(pars[1],-0.999,0.999),
   sd_ar = halfnormal(pars[2],sd=5),
   sigma = halfnormal(pars[3],sd=2)), nsim_states = 0)
}
opt <- nlminb(c(0.98, 0.15, 0.6), obj, lower = c(-0.999, 1e-4, 1e-4), upper = c(0.999,10,10))
pars <- opt$par
model <- svm(exchange, rho = uniform(pars[1],-0.999,0.999),
  sd_ar = halfnormal(pars[2],sd=5),
  sigma = halfnormal(pars[3],sd=2))




