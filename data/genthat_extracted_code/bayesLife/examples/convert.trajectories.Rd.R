library(bayesLife)


### Name: convert.e0.trajectories
### Title: Converting Trajectories of Life Expectancy into ACSII Files
### Aliases: convert.e0.trajectories
### Keywords: manip IO

### ** Examples

## Not run: 
##D sim.dir <- file.path(find.package("bayesLife"), "ex-data", "bayesLife.output")
##D pred.dir <- file.path(getwd(), "exampleLEpred")
##D 
##D # stores 10 trajectories out of 26 (2x(60-35)/2 + 1) into 
##D # exampleLEpred/predictions/ascii_trajectories.csv
##D e0.predict(sim.dir=sim.dir, output.dir=pred.dir, 
##D             burnin=35, save.as.ascii=10, verbose=TRUE)
##D             
##D # stores all 26 trajectories into the current directory
##D convert.e0.trajectories(dir=pred.dir, n="all", output.dir=".", verbose=TRUE)
##D 
##D # Note: If the output.dir argument in e0.predict is omitted, 
##D # call convert.e0.trajectories with dir=sim.dir 
## End(Not run)



