library(bayesPop)


### Name: pop.expressions
### Title: Expressions as used in Population Output Functions
### Aliases: pop.expressions
### Keywords: documentation

### ** Examples

sim.dir <- file.path(find.package("bayesPop"), "ex-data", "Pop")
pred <- get.pop.prediction(sim.dir, write.to.cache=FALSE)

# median age of women in child-bearing ages in Netherlands and all countries - trajectories
pop.trajectories.plot(pred, nr.traj=0,
    expression="pop.apply(P528_F{4:10}, gmedian, cats= seq(15, by=5, length=8))")
pop.trajectories.plotAll(pred, nr.traj=0, 
    expression="pop.apply(PXXX_F{4:10}, gmedian, cats= seq(15, by=5, length=8))")

# mean age of women in child-bearing ages in Netherlands - table
pop.trajectories.table(pred, 
    expression="pop.apply(age.func(P528_F{4:10}), fun=sum) / P528_F[4:10]")
# - gives the same results as with "pop.apply(P528_F{4:10}, gmean, cats=seq(15, by=5, length=8))"
# - for the mean age of childbearing, see ?mac.expression

# migration per capita by age
pop.byage.plot(pred, expression="GNL{} / PNL{}", year=2000)

## Not run: 
##D # potential support ratio - map (with the two countries
##D #       contained in pred object)
##D pop.map(pred, expression="PXXX[5:13] / PXXX[14:27]")
## End(Not run)

# proportion of 0-4 years old to whole population - export to an ASCII file
dir <- tempfile()
write.pop.projection.summary(pred, expression="PXXX[1] / PXXX", output.dir=dir)
unlink(dir)

## Not run: 
##D # These are vital events only available if keep.vital.events=TRUE in pop.predict, e.g.
##D # sim.dir.tmp <- tempfile()
##D # pred <- pop.predict(countries="Netherlands", nr.traj=3, 
##D #           				keep.vital.events=TRUE, output.dir=sim.dir.tmp)
##D # log female mortality rate by age for Netherlands in 2050, including 0-1 and 1-4 age groups
##D pop.byage.plot(pred, expression="log(MNL_F{age.index01(27)})", year=2050)
##D 
##D # trajectories of male 1q0 and table of 5q0 for Netherlands
##D pop.trajectories.plot(pred, expression="QNLD_M[-1]")
##D pop.trajectories.table(pred, expression="QNLD_M[1]")
##D # unlink(sim.dir.tmp)
## End(Not run)



