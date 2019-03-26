library(spacom)


### Name: MLSpawExact
### Title: Standard multilevel analysis applied to spatially weighted
###   context data
### Aliases: MLSpawExact
### Keywords: spatial

### ** Examples

## Spatially weighted multilevel analysis, with standard estimates of
## standard errors.
## It is step-3 function
## Model with two contextual predictors, treated as precise,
## predicting collective guilt acceptance.

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

## Step 2: Create spatially weighted contextual indicators

## from micro-level survey data (treated as precise)
aggregate <- SpawAggregate(contextual.data=traces_event,
                           context.id="area.name",
                           contextual.names='w_all',
                           contextual.weight.matrices=geow.100,
                           aggregation.functions="weighted.mean",
                           design.weight.names="weight",
                           nb.resamples=0)

## from precise indicator
weighted.homog.census <- SpawExact(precise.data=homog_census,
                                   context.id="area.name",
                                   contextual.names="Homog_00",
                                   contextual.weight.matrices=geow.100)

## merge aggregated and weighted data
context.data <- merge(aggregate, weighted.homog.census, by="area.name")


## Step 3: Perform MLSpawExact with two spatially weighted indicators
acc_w_homog_100 <-
  MLSpawExact(individual.level.data=traces_ind,
              context.id="area.name",
              formula=cg_acc ~ victim_d + comb_d + male + age_1990 +
              high_school + higher_edu + (1|area.name) + w_all.1 + Homog_00.1,
              precise.data=context.data)



