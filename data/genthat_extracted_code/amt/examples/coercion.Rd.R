library(amt)


### Name: coercion
### Title: Coerce a track to other formats.
### Aliases: coercion as_sp as_sp.steps_xy as_move as_move.track_xy
###   as_move.track_xyt as_ltraj as_ltraj.track_xy as_ltraj.track_xyt
###   as_bcpa as_bcpa.track_xyt as_moveHMM as_moveHMM.track_xy

### ** Examples

data(deer)
as_move(deer)
as_move(deer, id = "foo")
data(deer)
as_ltraj(deer)
as_ltraj(deer, id = "animal_3")
data(deer)
d <- as_bcpa(deer)
## Not run: 
##D bcpa1 <- bcpa::WindowSweep(d, "Theta", K = 2, windowsize = 50)
##D plot(bcpa1, type = "flat", clusterwidth = 1)
## End(Not run)
# Fit HMM with two states
data(deer)
dm <- as_moveHMM(deer)
## Not run: 
##D mu0 <- rep(mean(dm$step, na.rm = TRUE), 2) # step mean (two parameters: one for each state)
##D sigma0 <- rep(sd(dm$step, na.rm = TRUE), 2) # step SD
##D zeromass0 <- c(0.1, 0.05) # step zero-mass
##D stepPar0 <- c(mu0, sigma0, zeromass0)
##D angleMean0 <- c(pi, pi) # angle mean
##D kappa0 <- c(1, 1) # angle concentration
##D anglePar0 <- c(angleMean0, kappa0) ## call to fitting function
##D m1 <- fitHMM(data = dm, nbStates = 2,
##D        stepPar0 = stepPar0, anglePar0 = anglePar0, formula = ~ 1)
## End(Not run)




