library(bayesPop)


### Name: bayesPop-package
### Title: Probabilistic Population Projection
### Aliases: bayesPop-package bayesPop
### Keywords: package

### ** Examples

## Not run: 
##D sim.dir <- tempfile()
##D # Generates population projection for one country
##D country <- "Netherlands"
##D pred <- pop.predict(countries=country, output.dir=sim.dir)
##D summary(pred, country)
##D pop.trajectories.plot(pred, country)
##D dev.off()
##D pop.trajectories.plot(pred, country, sum.over.ages=TRUE)
##D pop.pyramid(pred, country)
##D pop.pyramid(pred, country, year=2100, age=1:26)
##D unlink(sim.dir, recursive=TRUE)
## End(Not run)

# Here are commands needed to run probabilistic projections
# from scratch, i.e. including TFR and life expectancy.
# Note that running the first four commands 
# (i.e. predicting TFR and life expectancy) can take 
# LONG time (up to several days; see below for possible speed-up). 
# For a toy simulation, set the number of iterations (iter) 
# to a small number.
## Not run: 
##D sim.dir.tfr <- "directory/for/TFR"
##D sim.dir.e0 <-  "directory/for/e0"
##D sim.dir.pop <- "directory/for/pop"
##D 
##D # Estimate TFR parameters (speed-up by including parallel=TRUE)
##D run.tfr.mcmc(iter="auto", output.dir=sim.dir.tfr, seed=1)
##D 
##D # Predict TFR (if iter above < 4000, reduce burnin and nr.traj accordingly)
##D tfr.predict(sim.dir=sim.dir.tfr, nr.traj=2000, burnin=2000)
##D 
##D # Estimate e0 parameters (females) (speed-up by including parallel=TRUE)
##D # Can be run independently of the two commands above
##D run.e0.mcmc(sex="F", iter="auto", output.dir=sim.dir.e0, seed=1)
##D 
##D # Predict female and male e0	
##D # (if iter above < 22000, reduce burnin and nr.traj accordingly)
##D e0.predict(sim.dir=sim.dir.e0, nr.traj=2000, burnin=20000)
##D 
##D # Population prediction
##D pred <- pop.predict(output.dir=sim.dir.pop, verbose=TRUE, 
##D     inputs = list(tfr.sim.dir=sim.dir.tfr, 
##D                   e0F.sim.dir=sim.dir.e0, e0M.sim.dir="joint_"))
##D pop.trajectories.plot(pred, "Madagascar", nr.traj=50, sum.over.ages=TRUE)
##D pop.trajectories.table(pred, "Madagascar")
## End(Not run)



