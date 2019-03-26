library(coxphSGD)


### Name: coxphSGD
### Title: Stochastic Gradient Descent log-likelihood Estimation in Cox
###   Proportional Hazards Model
### Aliases: coxphSGD

### ** Examples

library(survival)
set.seed(456)
x <- matrix(sample(0:1, size = 20000, replace = TRUE), ncol = 2)
head(x)
dCox <- dataCox(10^4, lambda = 3, rho = 2, x,
                beta = c(2,2), cens.rate = 5)
batch_id <- sample(1:90, size = 10^4, replace = TRUE)
dCox_split <- split(dCox, batch_id)
results <-
  coxphSGD(formula     = Surv(time, status) ~ x.1+x.2,
           data        = dCox_split,
           epsilon     = 1e-5,
           learn.rates = function(x){1/(100*sqrt(x))},
           beta.zero   = c(0,0),
           max.iter    = 10*90)
coeff_by_iteration <-
  as.data.frame(
    do.call(
      rbind,
      results$coefficients
    )
  )
head(coeff_by_iteration)



