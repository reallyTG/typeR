library(bayesTFR)


### Name: convert.tfr.trajectories
### Title: Converting TFR Trajectories into ACSII Files
### Aliases: convert.tfr.trajectories
### Keywords: manip IO

### ** Examples

## Not run: 
##D sim.dir <- file.path(find.package("bayesTFR"), "ex-data", "bayesTFR.output")
##D pred.dir <- file.path(getwd(), "exampleTFRpred")
##D 
##D # stores 10 trajectories out of 35 (1x(60-25)) into 
##D # exampleTFRpred/predictions/ascii_trajectories.csv
##D tfr.predict(sim.dir=sim.dir, output.dir=pred.dir, use.tfr3=FALSE,
##D             burnin=25, save.as.ascii=10, verbose=TRUE)
##D             
##D # stores all 35 trajectories into the current directory
##D convert.tfr.trajectories(dir=pred.dir, n="all", output.dir=".", verbose=TRUE)
##D 
##D # Note: If the output.dir argument in tfr.predict is omitted, 
##D # call convert.tfr.trajectories with dir=sim.dir 
## End(Not run)



