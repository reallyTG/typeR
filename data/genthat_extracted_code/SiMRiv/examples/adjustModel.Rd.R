library(SiMRiv)


### Name: adjustModel
### Title: Finds ("estimates") simulation input parameters able to
###   replicate a given (real) trajectory, assuming the given species model
### Aliases: adjustModel

### ** Examples

## Not run: 
##D library(SiMRiv)
##D library(adehabitatLT)
##D 
##D ## simulate "real" data, a Levy walk, for which we want to
##D ## parameterize our model
##D 
##D real.data <- simm.levy(1:500)[[1]][, 1:2]
##D 
##D ## Define a species model to adjust. Let's assume we don't know
##D ## much about what kind of real data we have, hence define
##D ## a flexible model: a two-state correlated random walk model
##D ## with variable step lengths.
##D ## This model implies "estimating" 6 parameters:
##D ##   - turning angle correlation of state 1 [0, 1]
##D ##   - turning angle correlation of state 2 [0, 1]
##D ##   - switching probability S1 -> S2 [0, 1]
##D ##   - switching probability S2 -> S1 [0, 1]
##D ##   - maximum step length of state 1 [0, ?]
##D ##   - maximum step length of state 2 [0, ?]
##D 
##D ## Let's assume we want to simulate at a 20 times higher time frequency
##D ## than real data.
##D ## In order to allow our model to adjust to real data, we have
##D ## to provide a maximum allowable step length to the optimization algorithm
##D ## that allows to recover real data after downsampling 20 times.
##D ## Let's make a simple calculation of the step lengths of real data:
##D 
##D tmp <- sampleMovement(real.data)
##D 
##D ## and compute a good maximum allowed step length during optimization
##D ## using the observed maximum divided by 20 (because each real step
##D ## will comprise 20 simulated steps)
##D 
##D max.step.length <- max(tmp$stat[, "steplengths"]) / 20
##D 
##D ## and finally build the species model with it.
##D ## Note: "CRW.CRW.sl" is the short name for the model we want,
##D ## as defined above
##D 
##D species.model <- speciesModel("CRW.CRW.sl", steplength = max.step.length)
##D 
##D ## now run optimization
##D 
##D sol <- adjustModel(real.data, species.model, resol = 20
##D 	, nbins.hist = c(3, 3), step.hist.log = TRUE)
##D 
##D ## After finishing, we can extract the input parameters of the optimized
##D ## solutions (100 by default) in the last generation (generation 1000
##D ## by default):
##D 
##D pars <- sol[[length(sol)]]$par
##D 
##D ## now we can take the optimized solutions and reconstruct species
##D ## based on them:
##D 
##D optimized.species <- apply(pars, 1, species.model)
##D 
##D ## and make some simulations with those optimized species.
##D ## Plot real trajectory
##D 
##D par(mfrow = c(2, 2), mar = c(0, 0, 1, 0))
##D plot(real.data, type = "l", asp = 1, axes = F, main = "Real")
##D 
##D ## plot three simulated trajectories with optimized species
##D 
##D for(i in 1:3) {
##D 	# remember we want to simulate at a 20 times higher frequency
##D 	# so we do 500 (real data) x 20 steps
##D 	sim <- simulate(optimized.species[[i]], 500 * 20)
##D 	
##D 	# now we downsample frequency to match real
##D 	samp <- sampleMovement(sim, 20)
##D 	
##D 	# and plot the simulated trajectory before and after
##D 	# downsampling 20 times.
##D 	
##D 	plot(sim[, 1:2], type = "l", asp = 1, axes = F, col = "gray"
##D 		, main = "Simulated and downsampled")
##D 	lines(samp$relocs, col = "black")
##D }
##D 
##D ## Now plot the evolution of parameters along algorithm's generations.
##D ## This is good to assess whether the final solutions converged
##D ## but see ?generationPlot for details
##D 
##D generationPlot(sol, species.model)
##D 
## End(Not run)



