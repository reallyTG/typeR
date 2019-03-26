library(CFC)


### Name: cfc.pbasis
### Title: Cause-specific competing-risk survival analysis in probability
###   denomination
### Aliases: cfc.pbasis

### ** Examples

## Not run: 
##D 
##D # prepare data for cause-specific competing-risk analysis
##D data(bmt)
##D bmt$status1 <- 1*(bmt$cause==1)
##D bmt$status2 <- 1*(bmt$cause==2)
##D f1 <- Surv(time, status1) ~ platelet + age + tcell
##D f2 <- Surv(time, status2) ~ platelet + age + tcell
##D 
##D # perform weibull regression on each cause independently
##D library(survival)
##D reg1 <- survreg(f1, bmt)
##D reg2 <- survreg(f2, bmt)
##D 
##D # predict times for given probabilities
##D # transpose predictions so that first dimension
##D # is time/probability (use first 50 observations for speed)
##D pvec <- seq(from=1.0, to = 0.1, length.out = 100)
##D pred1 <- t(predict(reg1, newdata = bmt[1:50,], p = 1-pvec, type = "quantile"))
##D pred2 <- t(predict(reg2, newdata = bmt[1:50,], p = 1-pvec, type = "quantile"))
##D 
##D # cause-specific competing risk analysis - probability mode
##D my.cfc <- cfc.pbasis(pred1, pred2, probs = pvec)
##D 
##D # calculating averages across observations (e.g. patients in the study)
##D my.summ <- summary(my.cfc)
##D 
##D # plotting average CI and event-free probability curves
##D plot(my.summ)
##D 
## End(Not run)



