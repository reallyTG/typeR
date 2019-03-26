library(spacom)


### Name: spacom-package
### Title: Spatially weighted context data for multilevel modelling
### Aliases: spacom-package spacom
### Keywords: "package" "spatial"

### ** Examples


## Testing the model described in Elcheroth et al (2012), page 25, Equation 9.4
## Collective guilt assignment (outcome) is predicted by a series of individual level predictors,
## and two contextual predictors: risk of war victimization weighted by geographical proximity and
## common territorial identification

## DATA PREPARATION
## Import data
## load individual level data
data(traces_ind)

## exclude variable "cg_acc" and missing values
traces_ind <- na.exclude(traces_ind[,-6])

## load contextual indicator for aggregation
data(traces_event)
## Don't show: 
traces_event=traces_event[seq(1, nrow(traces_event), by=100),]
## End(Don't show)

## load distance matrices
data(d_geo)
data(d_ident)

## EXPLORATORY ANALYSIS

## Examining the impact of the risk of war victimization weighted by geographical
## proximity weights with bandwidths of 25, 50 and 100 km

explo.wv <- ExploreMLSpawAggregate(individual.level.data=traces_ind,
                                   contextual.name="w_all",
                                   contextual.data=traces_event,
                                   context.id="area.name",
                                   formula=cg_ass~victim_d+comb_d+
                                   male+age_1990+high_school+higher_edu+
                                   (1|area.name),
                                   distance.matrix=d_geo,
                                   multilevel.bandwidths=c(25, 50, 100),
                                   design.weight.names = "weight",
                                   aggregation.function = "weighted.mean",
                                   kernel = NULL)

## STEP 1: Create spatial weights

## geographical proximity, bandwidth=50
geow.50 <- WeightMatrix(d_geo, bandwidth=50)

## common territorial identification, bandwidth=2
w.id <- WeightMatrix(d_ident,bandwidth=2)

## STEP 2: Create spatially weighted aggregated indicator of risk of war victimization

wv.agg <- SpawAggregate(contextual.data=traces_event,
                        context.id="area.name",
                        contextual.names=c("w_all", "w_all"),
                        contextual.weight.matrices=list(geow.50, w.id),
                        aggregation.functions="weighted.mean",
                        design.weight.names="weight",
                        nb.resamples=2)
## If wanted, the names of aggregated indicators in wv.agg can be changed
names(wv.agg) <- c("wv.50", "wv.id")

## STEP 3: Perform multilevel analysis (Eq 9.4, Elcheroth et al (2012), p. 25)

mla.results <- ResampleMLSpawAggregate(individual.level.data=traces_ind,
									   context.id="area.name",
			formula= cg_ass ~ victim_d+ comb_d+ male+ age_1990+
                                     high_school+ higher_edu + (1|area.name)+ wv.50 + wv.id,
                        aggregates = wv.agg, precise.data=NULL)

## STEP 4: Test the residual spatial dependency of the previous model
mla.results.moran <- MLSpawResidMoran(ml.spaw.obj=mla.results,
							          distance.matrix=d_geo,
							          bandwidths=c(25,50,100,200))

## Plotting spatial variogram with the values in mla.results.moran
## See plot() and par() for details
## Not run: 
##D plot(mla.results.moran[,1], xaxt="n", xlab="Bandwidth values", ylab="Moran's I", type="b")
##D axis(side=1, at=1:nrow(mla.results.moran), labels=rownames(mla.results.moran)) 
## End(Not run)




