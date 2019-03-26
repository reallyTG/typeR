library(CFC)


### Name: cfc.tbasis
### Title: Cause-specific competing-risk survival analysis in time
###   denomination
### Aliases: cfc.tbasis

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
##D # sample-based bayesian weibull regression
##D library(BSGW)
##D reg1 <- bsgw(f1, bmt, ordweib = TRUE, control = bsgw.control(iter = 500, burnin = 100, nskip = 50))
##D reg2 <- bsgw(f2, bmt, ordweib = TRUE, control = bsgw.control(iter = 500, burnin = 100, nskip = 50))
##D 
##D # prediction on a uniform grid of 100 time points
##D # (use first 50 observations for speed)
##D pred1 <- predict(reg1, newdata = bmt[1:50,], tvec = 100)
##D pred2 <- predict(reg2, newdata = bmt[1:50,], tvec = 100)
##D 
##D # permuting dimensions of survival objects to conform with cfc
##D S1 <- aperm(pred1$smp$S, c(2,1,3))
##D S2 <- aperm(pred2$smp$S, c(2,1,3))
##D 
##D # cause-specific competing risk analysis - time mode
##D my.cfc <- cfc.tbasis(S1, S2)
##D 
##D # calculating averages across observations (e.g. patients in the study)
##D my.summ <- summary(my.cfc, MARGIN = c(1,2))
##D 
##D # plotting mean CI and event-free functions
##D # as well as their sampled-based confidence intervals
##D plot(my.summ, t = pred1$tvec)
##D 
##D 
## End(Not run)



