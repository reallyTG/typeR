library(spacom)


### Name: MLSpawExactOutput-class
### Title: Class '"MLSpawExactOutput"'
### Aliases: MLSpawExactOutput-class AIC,MLSpawExactOutput-method
###   BIC,MLSpawExactOutput-method fixef,MLSpawExactOutput-method
###   print,MLSpawExactOutput-method ranef,MLSpawExactOutput-method
###   show,MLSpawExactOutput-method summary,MLSpawExactOutput-method
###   VarCorr,MLSpawExactOutput-method
### Keywords: classes spatial

### ** Examples

## Perform MLSpawExact

## Import and prepare data (see details in MLSpawExact)

data(traces_ind)
traces_ind <- traces_ind[,-7]
traces_ind <- na.exclude(traces_ind)
data(traces_event)
## Don't show: 
traces_event=traces_event[seq(1, nrow(traces_event), by=100),]
## End(Don't show)
data(homog_census)
data(d_geo)

## Step 1: Create spatial weights
geow.100 <- WeightMatrix(d_geo, bandwidth=100)

## Step 2: Create spatially weighted contextual indicators
aggregate <- SpawAggregate(contextual.data=traces_event,
                           context.id="area.name",
                           contextual.names='w_all',
                           contextual.weight.matrices=geow.100,
                           aggregation.functions="weighted.mean",
                           design.weight.names="weight",
                           nb.resamples=0)

## Step 3: Perform MLSpawExact with the spatially weighted indicator
acc_w100 <- MLSpawExact(individual.level.data=traces_ind,
              			context.id="area.name",
              			formula=cg_acc ~ victim_d + comb_d + male + age_1990 +
              			high_school + higher_edu + (1|area.name) + w_all.1,
              			precise.data=aggregate)
              			
## acc_w100 is an object of class MLSpawExactOutput              			
class(acc_w100)

## to assess standardized coefficients
acc_w100@beta

## look at the fitted mixed-effect model :
acc_w100@lme 
## to assess non-standardized fixed coefficients
fixef(acc_w100@lme)

## to assess the deviance of the fitted model
deviance(acc_w100@lme)

## for details about slots within @lme see   ?merMod-class{lme4}



