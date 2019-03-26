library(spacom)


### Name: MLSpawResidMoran
### Title: Testing the (residual) spatial dependency
### Aliases: MLSpawResidMoran
### Keywords: "spatial"

### ** Examples

# Residual spatial autocorrelation
## It is step-4 function
## for residuals from ResampleAggregateSpawML

## Data preparation

## load individual level data, remove collective guilt assignment for the
## data frame, and remove NA's
data(traces_ind)
traces_ind <- traces_ind[,-7]
traces_ind <- na.exclude(traces_ind)

## load contextual indicator for aggregation
data(traces_event)
## Don't show: 
traces_event=traces_event[seq(1, nrow(traces_event), by=100),]
## End(Don't show)

## load precise contextual indicator
data(homog_census)

## load distance matrix
data(d_geo)

## Step 1: Create spatial weights
geow.100 <- WeightMatrix(d_geo, bandwidth=100)


## Step 2: Compute spatially weighted aggregated contextual indicator
wv.agg.100 <- SpawAggregate(
              contextual.data = traces_event,
              context.id="area.name",
              contextual.names = "w_all",
              contextual.weight.matrices=geow.100,
              nb.resamples=5,
              aggregation.functions="weighted.mean",
              design.weight.names="weight",
              sample.seed=1)

## rename weighted variable name so it reflects the used weighting
## matrix
names(wv.agg.100) <- "w_all.100"

## Step 3: Perform ResampleMLSpawAggregate
acc_w_100 <-
ResampleMLSpawAggregate(
  individual.level.data=traces_ind,
  context.id="area.name",
  formula=cg_acc ~ victim_d + comb_d + male + age_1990 + high_school +
  higher_edu + (1|area.name) + w_all.100,
  aggregates=wv.agg.100,
  precise.data=NULL)

## Step 4: Perform MLSpawResidMoran for bandwidths 25, 50, 100, 200 

## Not run: 
##D MI_acc <- MLSpawResidMoran(ml.spaw.obj=acc_w_100,
##D   distance.matrix=d_geo,
##D   bandwidths=c(25,50,100,200)) 
## End(Not run)
## Don't show: 
MI_acc <- MLSpawResidMoran(ml.spaw.obj=acc_w_100,
  distance.matrix=d_geo, bandwidths=c(25,50)) 
## End(Don't show)
  
## The results can be used for plotting spatial variogram
## See plot() and par() for details 
## Not run: 
##D plot(MI_acc[,1], xaxt="n", xlab="Bandwidth values", ylab="Moran's I", type="b")
##D axis(side=1, at=1:nrow(MI_acc), labels=rownames(MI_acc)) 
## End(Not run)
  



