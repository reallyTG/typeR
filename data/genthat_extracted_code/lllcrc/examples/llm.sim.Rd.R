library(lllcrc)


### Name: llm.sim
### Title: Simulate basic log-linear CRC experiments
### Aliases: llm.sim

### ** Examples

## Not run: 
##D ## A basic simulation with four lists.
##D #	Begin by specifying the vector of log-linear parameters.
##D #	The parameters must match the design matrix:
##D names(make.design.matrix(k=4))
##D u.vec = initialize.u.vec(k=4)
##D u.vec[5:10] = 2
##D ## Run the simulation with an adjustment to the main effects in
##D #	u.vec such that the probability of nondetection is 0.5.
##D sim = llm.sim(n.grid = c(100,300,900,2700), n.reps = 10, u.vec,
##D 	p0 = 0.5, ic = "BIC", cell.adj = FALSE)
##D # View the results
##D plot(sim)
## End(Not run)



