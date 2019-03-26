library(intccr)


### Name: ciregic
### Title: Competing Risks Regression with Interval-Censored Data
### Aliases: ciregic
### Keywords: ciregic

### ** Examples

## Set seed in order to have reproducibility of the bootstrap standard error estimate
set.seed(1234)

## Reshaping data from a long format to a suitable format
newdata <- dataprep(data = longdata, ID = "id", time = "t",
                    event = "c", Z = c("z1", "z2"))
## Estimation of regression parameters only. No bootstrap variance estimation.
## with 'newdata'
fit <- ciregic(formula = Surv2(v, u, c) ~ z1 + z2, data = newdata,
               alpha = c(1, 1), nboot = 0, do.par = FALSE)
fit

## Estimation of regression parameters only. No bootstrap variance estimation.
## with 'simdata'
fit.simdata <- ciregic(formula = Surv2(v, u, c) ~ z1 + z2, data = simdata,
                       alpha = c(1, 1), nboot = 0, do.par = FALSE)
fit.simdata

## Not run: 
##D ## Bootstrap variance estimation based on 50 replications
##D fit <- ciregic(formula = Surv2(v, u, c) ~ z1 + z2, data = newdata,
##D                alpha = c(1, 1), nboot = 50, do.par = FALSE)
## End(Not run)
## Note that the user can use parallel computing to decrease
## the computation time of the bootstrap variance-covariance
## estimation (e.g. nboot = 50)

## Summarize semiparametric regression model
summary(fit)

## Predict and draw plot the cumulative incidence function evaluated at z1 = 1 and z2 = 0.5
t <- seq(from = 0, to = 2.8, by = 2.8 / 99)
pred <- predict(object = fit, covp = c(1, 0.5), times = t)
pred
plot(pred$t, pred$cif1, type = "l", ylim = c(0, 1))
points(pred$t, pred$cif2, type = "l", col = 2)




