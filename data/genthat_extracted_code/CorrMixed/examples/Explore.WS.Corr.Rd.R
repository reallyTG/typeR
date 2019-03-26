library(CorrMixed)


### Name: Explore.WS.Corr
### Title: Explore within-subject correlations (reliabilities)
### Aliases: Explore.WS.Corr
### Keywords: Exploratory analysis Within-subject correlation Bootstrap
###   Reliability

### ** Examples

# Open data
data(Example.Data)

# Explore correlation structure
Expl_Corr <- Explore.WS.Corr(OLS.Model="Outcome~as.factor(Time)+ 
  as.factor(Cycle) + as.factor(Condition)", Dataset=Example.Data, 
  Id="Id", Time="Time", Alpha=.05, Number.Bootstrap=50, Seed=123)

# explore results
summary(Expl_Corr)

# plot with correlations for all time lags, and 
# add smoothed (loess) correlation function 
plot(Expl_Corr, Indiv.Corrs=TRUE)
# plot bootstrapped smoothed (loess) correlation function 
plot(Expl_Corr)



