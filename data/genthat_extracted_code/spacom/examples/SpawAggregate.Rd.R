library(spacom)


### Name: SpawAggregate
### Title: Create and describe spatially weighted survey estimates for
###   contextual indicators
### Aliases: SpawAggregate
### Keywords: spatial

### ** Examples

## Creating spatially weighted aggregated contextual indicator - spatially weighted 
## risk of war victimization across TRACES areas.
## This is step-2 function

## Step 1: Load distance matrix and create weights
data(d_geo)
geow.50 <- WeightMatrix(d_geo, bandwidth=50)

## Step 2: Load dataframe with micro-level data for aggregation and create 
## spatially weighted contextual indicator (risk of war victimization weighted by geow.50)

data(traces_event)
## Don't show: 
traces_event=traces_event[seq(1, nrow(traces_event), by=100),]
## End(Don't show)

wv.g50 <- SpawAggregate(contextual.data=traces_event,
                           context.id="area.name",
                           contextual.names="w_all",
                           contextual.weight.matrices=geow.50,
                           aggregation.functions="weighted.mean",
                           design.weight.names="weight",
                           nb.resamples=5)

## To create non-weighted and spatially weighted (by geow.50) risk of war victimization 

wv.nw.g50 <- SpawAggregate(contextual.data=traces_event,
                           context.id="area.name",
                           contextual.names=c("w_all","w_all"),
                           contextual.weight.matrices=list(NULL,geow.50),
                           aggregation.functions="weighted.mean",
                           design.weight.names="weight",
                           nb.resamples=5)



