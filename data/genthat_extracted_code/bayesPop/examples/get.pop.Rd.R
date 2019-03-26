library(bayesPop)


### Name: pop.trajectories
### Title: Accessing Trajectories
### Aliases: get.pop get.pop.ex get.pop.exba pop.trajectories
###   get.trajectory.indices extract.trajectories.eq
###   extract.trajectories.ge extract.trajectories.le
### Keywords: manip

### ** Examples

sim.dir <- file.path(find.package("bayesPop"), "ex-data", "Pop")
pred <- get.pop.prediction(sim.dir, write.to.cache=FALSE)

# observed female of Netherlands by age; 1x21x14x1 array
popFNL <- get.pop("PNL_F{}", pred, observed=TRUE)

# observed migration for all countries in the prediction object,
# here 2 countries; 2x1x14x1 array
migAll <- get.pop("GXXX", pred, observed=TRUE)

# projection population for Ecuador with 3 trajectories; 
# 1x1x18x3 array
popEcu <- get.pop("P218", pred, observed=FALSE)

# the above is equivalent to 
popEcu2 <- pop.trajectories(pred, "Ecuador")

# Expression "PNL_F{} / PNL_M{}" evaluated on projections
# is internally replaced by
FtoM <- get.pop("PNL_F{}", pred) / get.pop("PNL_M{}", pred)
# should return the same result as
FtoMa <- get.pop.exba("PNL_F{} / PNL_M{}", pred)

# the same expression by time (summed over ages) 
FtoMt <- get.pop.ex("PNL_F / PNL_M", pred)

# the example simulation was generated with 3 TFR trajectories ...
get.trajectory.indices(pred, "Netherlands", what="TFR")
# ... and 1 e0 trajectory 
get.trajectory.indices(pred, "Netherlands", what="e0M")

# The three trajectories of the population ratio of Ecuador to Netherlands
get.pop.ex("PEC/PNL", pred)
# Returns the trajectory closest to the upper 80% bound, including the corresponding index
extract.trajectories.eq(pred, expression="PEC/PNL", quant=0.9)
# Returns the median trajectory and the high variant, including the corresponding index
extract.trajectories.ge(pred, expression="PEC/PNL", quant=0.45)



