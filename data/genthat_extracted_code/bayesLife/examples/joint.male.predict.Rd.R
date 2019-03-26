library(bayesLife)


### Name: e0.jmale.predict
### Title: Prediction of the Joint Female-Male Model
### Aliases: e0.jmale.predict
### Keywords: models

### ** Examples

## Not run: 
##D sim.dir <- tempfile()
##D m <- run.e0.mcmc(sex='F', nr.chains=1, iter=30, thin=1, output.dir=sim.dir)
##D pred <- e0.predict(m, burnin=15, verbose=FALSE, save.as.ascii=0)
##D both.pred <- e0.jmale.predict(pred)
##D e0.trajectories.plot(both.pred, 'Guatemala') # Female
##D e0.trajectories.plot(get.e0.jmale.prediction(both.pred), 'Guatemala') # Male
##D 
##D # Marginal distribution of the sex-specific projections
##D e0.trajectories.plot(both.pred, 'Guatemala', both.sexes=TRUE,  pi=80)
##D 
##D # Plotting the gaps
##D e0.gap.plot(both.pred, 'Guatemala')
##D 
##D # Joint distribution of the sex-specific projections
##D e0.joint.plot(both.pred, 'Guatemala', pi=80, years=c(2013, 2043, 2093))
##D 
##D unlink(sim.dir, recursive=TRUE)
## End(Not run)


