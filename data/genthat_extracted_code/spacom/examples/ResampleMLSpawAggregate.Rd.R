library(spacom)


### Name: ResampleMLSpawAggregate
### Title: Spatially weighted multilevel analysis with stratified
###   resampling for aggregated context data
### Aliases: ResampleMLSpawAggregate
### Keywords: spatial

### ** Examples

## Spatially weighted multilevel analysis, with resampled both individual
## level indicators and contextual predictors for aggregation. It may
## include non-resampled precise contextual indicator. 
## It is step-3 function
## Predicting collective guilt acceptance. 

## Data preparation
## load individual level data, remove collective guilt assignment from the
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


## Step 2: Create spatially weighted aggregated and precise indicators

wv.agg.100 <- SpawAggregate(
              contextual.data = traces_event,
              context.id="area.name",
              contextual.names = "w_all",
              contextual.weight.matrices=geow.100,
              nb.resamples=5,
              aggregation.functions="weighted.mean",
              design.weight.names="weight",
              sample.seed=1)
            
homog.100 <- SpawExact(precise.data=homog_census,
                       context.id="area.name",
                       contextual.names="Homog_00",
                       contextual.weight.matrices=geow.100)

## rename weighted variable names so they reflect the used weighting
## matrix
names(wv.agg.100) <- "w_all.100"
names(homog.100)[2] <- "Homog.100"


##  Step 3: Perform ResampleMLSpawAggregate
acc_w_homog_100 <-
ResampleMLSpawAggregate(
  individual.level.data=traces_ind,
  context.id="area.name",
  formula=cg_acc ~ victim_d + comb_d + male + age_1990 + high_school +
  higher_edu + (1|area.name) + w_all.100 + Homog.100,
  aggregates=wv.agg.100,
  precise.data=homog.100)  




