library(bayesPop)


### Name: LifeTableMx
### Title: Life Table Functions
### Aliases: LifeTableMx LifeTableMxCol
### Keywords: attribute

### ** Examples

## Not run: 
##D sim.dir <- tempfile()
##D pred <- pop.predict(countries="Ecuador", output.dir=sim.dir, wpp.year=2015,
##D     present.year=2015, keep.vital.events=TRUE, fixed.mx=TRUE, fixed.pasfr=TRUE)
##D # get male mortality rates from 2020 for age groups 0-1, 1-4, 5-9, ...
##D mxm <- pop.byage.table(pred, expression="MEC_M{age.index01(27)}", year=2020)[,1]
##D print(LifeTableMx(mxm), digits=3)
##D # female LT with first two age categories collapsed 
##D mxf <- pop.byage.table(pred, expression="MEC_F{age.index01(27)}", year=2020)[,1]
##D print(LifeTableMx(mxf, sex="Female", include01=FALSE), digits=3)
##D unlink(sim.dir, recursive=TRUE)
## End(Not run)



