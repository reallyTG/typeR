library(trackdem)


### Name: simulTrajec
### Title: Simulate trajectories and save as png files.
### Aliases: simulTrajec

### ** Examples

## Not run: 
##D dir.create("images")
##D ## Create image sequence and save as png's in the working directory.
##D traj <- simulTrajec(path="images",
##D                     nframes=30,nIndividuals=20,domain="square",
##D                     h=0.01,rho=0.9,
##D                     sizes=runif(20,0.004,0.006))
## End(Not run)



