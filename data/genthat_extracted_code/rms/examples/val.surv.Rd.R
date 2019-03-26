library(rms)


### Name: val.surv
### Title: Validate Predicted Probabilities Against Observed Survival Times
### Aliases: val.surv plot.val.surv plot.val.survh print.val.survh
### Keywords: models regression smooth survival

### ** Examples

# Generate failure times from an exponential distribution
set.seed(123)              # so can reproduce results
n <- 1000
age <- 50 + 12*rnorm(n)
sex <- factor(sample(c('Male','Female'), n, rep=TRUE, prob=c(.6, .4)))
cens <- 15*runif(n)
h <- .02*exp(.04*(age-50)+.8*(sex=='Female'))
t <- -log(runif(n))/h
units(t) <- 'Year'
label(t) <- 'Time to Event'
ev <- ifelse(t <= cens, 1, 0)
t <- pmin(t, cens)
S <- Surv(t, ev)

# First validate true model used to generate data

# If hare is available, make a smooth calibration plot for 1-year
# survival probability where we predict 1-year survival using the
# known true population survival probability
# In addition, use groupkm to show that grouping predictions into
# intervals and computing Kaplan-Meier estimates is not as accurate.

if('polspline' %in% row.names(installed.packages())) {
  s1 <- exp(-h*1)
  w <- val.surv(est.surv=s1, S=S, u=1,
                fun=function(p)log(-log(p)))
  plot(w, lim=c(.85,1), scat1d.opts=list(nhistSpike=200, side=1))
  groupkm(s1, S, m=100, u=1, pl=TRUE, add=TRUE)
}

# Now validate the true model using residuals

w <- val.surv(est.surv=exp(-h*t), S=S)
plot(w)
plot(w, group=sex)  # stratify by sex


# Now fit an exponential model and validate
# Note this is not really a validation as we're using the
# training data here
f <- psm(S ~ age + sex, dist='exponential', y=TRUE)
w <- val.surv(f)
plot(w, group=sex)


# We know the censoring time on every subject, so we can
# compare the predicted Pr[T <= observed T | T>c, X] to
# its expectation 0.5 Pr[T <= C | X] where C = censoring time
# We plot a ratio that should equal one
w <- val.surv(f, censor=cens)
plot(w)
plot(w, group=age, g=3)   # stratify by tertile of age



