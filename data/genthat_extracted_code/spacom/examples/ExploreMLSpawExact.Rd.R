library(spacom)


### Name: ExploreMLSpawExact
### Title: Exploratory multilevel analysis with spatially weighted context
###   data
### Aliases: ExploreMLSpawExact ExploreMLSpawAggregate
### Keywords: spatial

### ** Examples

#### ExploreMLSpaw
# Exploratory spatially weighted multilevel with standard estimates of
# standard errors. Accepts only one contextual predictor. Predicting
# collective guilt acceptance. Precise contextual predictor (ethnic homogeneity)
# weighted with geographical proximity weights, h=50,100,200.

# load individual level data, remove collective guilt assignment from the
# data frame, and remove NA's
data(traces_ind)

traces_ind <- traces_ind[,-7]
traces_ind <- na.exclude(traces_ind)

# load precise contextual indicator
data(homog_census)

# load distance matrix
data(d_geo)

# perform ExploreMLSpawExact
acc_homog <- ExploreMLSpawExact(
  individual.level.data=traces_ind,
  contextual.name="Homog_00",
  context.id="area.name",
  formula=cg_acc ~ victim_d + comb_d + male + age_1990 + high_school +
  higher_edu + (1|area.name),
  precise.data=homog_census,
  distance.matrix=d_geo,
  multilevel.bandwidths=c(50, 100))




