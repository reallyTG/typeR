library(CorrMixed)


### Name: WS.Corr.Mixed
### Title: Estimate within-subject correlations (reliabilities) based on a
###   mixed-effects model.
### Aliases: WS.Corr.Mixed
### Keywords: Within-subject correlation Test-retest correlation
###   Mixed-effects model Bootstrap Reliability

### ** Examples

# open data
data(Example.Data)

# Make covariates used in mixed model
Example.Data$Time2 <- Example.Data$Time**2
Example.Data$Time3 <- Example.Data$Time**3
Example.Data$Time3_log <- (Example.Data$Time**3) * (log(Example.Data$Time))

# model 1: random intercept model
Model1 <- WS.Corr.Mixed(
Fixed.Part=Outcome ~ Time2 + Time3 + Time3_log + as.factor(Cycle) 
+ as.factor(Condition), Random.Part = ~ 1|Id, 
Dataset=Example.Data, Model=1, Id="Id", Number.Bootstrap = 50, 
Seed = 12345)

  # summary of the results
summary(Model1)
  # plot the results
plot(Model1)

## Not run: 
##D time-consuming code parts
##D # model 2: random intercept + Gaussian serial corr
##D Model2 <- WS.Corr.Mixed(
##D Fixed.Part=Outcome ~ Time2 + Time3 + Time3_log + as.factor(Cycle) 
##D + as.factor(Condition), Random.Part = ~ 1|Id, 
##D Correlation=corGaus(form= ~ Time, nugget = TRUE),
##D Dataset=Example.Data, Model=2, Id="Id", Seed = 12345)
##D 
##D   # summary of the results
##D summary(Model2)
##D 
##D   # plot the results
##D     # estimated corrs as a function of time lag (default plot)
##D plot(Model2)
##D     # estimated corrs for all pairs of time points
##D plot(Model2, All.Individual = T)
##D 
##D # model 3
##D Model3 <- WS.Corr.Mixed(
##D   Fixed.Part=Outcome ~ Time2 + Time3 + Time3_log + as.factor(Cycle) 
##D   + as.factor(Condition), Random.Part = ~ 1 + Time|Id, 
##D   Correlation=corGaus(form= ~ Time, nugget = TRUE),
##D   Dataset=Example.Data, Model=3, Id="Id", Seed = 12345)
##D 
##D   # summary of the results
##D summary(Model3)
##D 
##D   # plot the results
##D     # estimated corrs for all pairs of time points
##D plot(Model3)
##D     # estimated corrs as a function of time lag
## End(Not run)



