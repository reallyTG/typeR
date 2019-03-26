library(bayesTFR)


### Name: tfr.predict.subnat
### Title: Generating Posterior Trajectories of Subnational TFR
### Aliases: tfr.predict.subnat
### Keywords: models ts

### ** Examples

# View the example data
my.subtfr.file <- file.path(find.package("bayesTFR"), 'extdata', 'subnational_tfr_template.txt')
subtfr <- read.delim(my.subtfr.file, check.names=FALSE)
head(subtfr)

# Directory with national projections (contains 30 trajectories for each country)
nat.dir <- file.path(find.package("bayesTFR"), "ex-data", "bayesTFR.output")

# Subnational projections for Australia and Canada
subnat.dir <- tempfile()
preds <- tfr.predict.subnat(c(36, 124), my.tfr.file=my.subtfr.file,
    sim.dir=nat.dir, output.dir=subnat.dir, start.year=2013)
names(preds)
get.countries.table(preds[["36"]])
summary(preds[["36"]], "Queensland")
tfr.trajectories.plot(preds[["36"]], "Queensland")

# plot subnational and national TFR in one plot
nat.pred <- get.tfr.prediction(nat.dir)
tfr.trajectories.plot(preds[["36"]], 186, pi=80, half.child.variant=FALSE)
tfr.trajectories.plot(nat.pred, "Australia", half.child.variant=FALSE,
      add=TRUE, col=rep("darkgreen", 5), nr.traj=0, show.legend=FALSE)
legend("topright", c("regional TFR", "national TFR"), col=c("red", "darkgreen"), 
  lty=1, bty='n')

# Retrieve trajectories
trajs.Alberta <- get.tfr.trajectories(preds[["124"]], "Alberta")
summary(t(trajs.Alberta))

# cleanup
unlink(subnat.dir)

# See more examples in ?get.regtfr.prediction



