library(spacom)


### Name: ResampleMLSpawOutput-class
### Title: Class '"ResampleMLSpawOutput"'
### Aliases: ResampleMLSpawOutput-class print,ResampleMLSpawOutput-method
###   show,ResampleMLSpawOutput-method
### Keywords: classes spatial

### ** Examples

## Perform ResampleMLSpawExact

## Data preparation (see ResampleMLSpawExact)

data(traces_ind)
traces_ind <- traces_ind[,-7]
traces_ind <- na.exclude(traces_ind)
data(homog_census)
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

## acc_homog100 is an object of class ResampleMLSpawOutput
class(acc_homog100)

## to assess standardized fixed effects coefficients
acc_homog100@betas

## to assess non-standardized fixed effects coefficients
acc_homog100@fixed

## to assess only median of non-standardized fixed effects coefficients
## Not run: 
##D acc_homog100@fixed["50%"] 
## End(Not run)

## to assess random effects
acc_homog100@random.var



