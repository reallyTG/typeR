library(CoxPlus)


### Name: CoxPlus
### Title: Cox Regression (Proportional Hazards Model) with Multiple Causes
###   and Mixed Effects
### Aliases: CoxPlus CoxPlus-package fastCox

### ** Examples

# Simulate a dataset. lam=exp(x), suvtime depends on lam
x = rnorm(5000)
suvtime = -log(runif(length(x)))/exp(x)
# Censor 80% of events
thd = quantile(suvtime, 0.2)
event = as.numeric(suvtime <= thd)
suvtime[suvtime>thd] = thd

# The estimates of beta should be very close to 1, the true value
head = cbind(start=0,stop=suvtime,event=event,weight=1)
est = fastCox(head,~x)
print(est$result)



