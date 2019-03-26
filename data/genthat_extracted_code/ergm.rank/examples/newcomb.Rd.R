library(ergm.rank)


### Name: newcomb
### Title: Newcomb's Fraternity Networks
### Aliases: newcomb
### Keywords: datasets

### ** Examples

## No test: 
# Note: This takes a long time.
data(newcomb)

# Fit a model for the transition between initial (time 0) ranking and
# ranking after one week (time 1). Note that MCMC interval has been
# decreased to save time.
newcomb.1.2.fit <- ergm(newcomb[[2]]~
                        rank.inconsistency(newcomb[[1]],"descrank")+
                        rank.deference+rank.nonconformity("all")+
                        rank.nonconformity("localAND"),
                        response="descrank", reference=~CompleteOrder,
                        control=control.ergm(MCMLE.trustregion=10000,
                                             MCMC.interval=10))
# Check MCMC diagnostics (barely adequate).
mcmc.diagnostics(newcomb.1.2.fit)
summary(newcomb.1.2.fit)
## End(No test)



