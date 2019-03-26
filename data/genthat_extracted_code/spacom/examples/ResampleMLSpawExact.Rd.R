library(spacom)


### Name: ResampleMLSpawExact
### Title: Spatially weighted multilevel analysis with stratified
###   resampling for exact context data
### Aliases: ResampleMLSpawExact
### Keywords: spatial

### ** Examples

# Spatially weighted multilevel analysis, with resampled individual
# level indicators and precise contextual indicator. 

## It is step-2 function

## Data preparation

##  load individual level data, remove collective guilt assignment from the
## data frame, and remove NA's 
data(traces_ind)
traces_ind <- traces_ind[,-7]
traces_ind <- na.exclude(traces_ind)

## load precise contextual indicator
data(homog_census)

## load distance matrix 
data(d_geo)

## Step 1: Create spatial weights
geow.100 <- WeightMatrix(d_geo, bandwidth=100)

## Step 2: Create spatially weighted precise contextual indicator
homog.100 <- SpawExact(precise.data=homog_census,
                       context.id="area.name",
                       contextual.names="Homog_00",
                       contextual.weight.matrices=geow.100)
## rename weighted variable names so they reflect the used weighting
## matrix
names(homog.100)[2] <- "Homog.100"                       

## Step 3: Perform ResampleMLSpawExact
acc_homog100 <-
  ResampleMLSpawExact(
    individual.level.data=traces_ind,
    context.id="area.name",
    formula=cg_acc ~ victim_d + comb_d + male + age_1990 + high_school +
    higher_edu + Homog.100 + (1|area.name), precise.data=homog.100,
    nb.resamples=10)



