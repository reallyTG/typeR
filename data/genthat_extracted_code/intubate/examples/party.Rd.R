library(intubate)


### Name: party
### Title: Interfaces for party package for data science pipelines.
### Aliases: ntbt_cforest ntbt_ctree ntbt_mob
### Keywords: intubate magrittr party cforest ctree mob

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(party)
##D 
##D ## ntbt_cforest: Random Forest
##D 
##D ### honest (i.e., out-of-bag) cross-classification of
##D ### true vs. predicted classes
##D data("mammoexp", package = "TH.data")
##D #table(mammoexp$ME, predict(cforest(ME ~ ., data = mammoexp, 
##D #                                   control = cforest_unbiased(ntree = 50)),
##D #                           OOB = TRUE))
##D 
##D ## Original function to interface
##D set.seed(290875)
##D cforest(ME ~ ., data = mammoexp, control = cforest_unbiased(ntree = 50))
##D 
##D ## The interface puts data as first parameter
##D set.seed(290875)
##D ntbt_cforest(mammoexp, ME ~ ., control = cforest_unbiased(ntree = 50))
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(290875)
##D mammoexp %>%
##D   ntbt_cforest(ME ~ ., control = cforest_unbiased(ntree = 50))
##D 
##D ## ntbt_ctree: Conditional Inference Trees
##D airq <- subset(airquality, !is.na(Ozone))
##D 
##D ## Original function to interface
##D set.seed(290875)
##D ctree(Ozone ~ ., data = airq, controls = ctree_control(maxsurrogate = 3))
##D 
##D ## The interface puts data as first parameter
##D set.seed(290875)
##D ntbt_ctree(airq, Ozone ~ ., controls = ctree_control(maxsurrogate = 3))
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(290875)
##D airq %>%
##D   ntbt_ctree(Ozone ~ ., controls = ctree_control(maxsurrogate = 3))
##D 
##D 
##D ## ntbt_mob: Model-based Recursive Partitioning
##D data("BostonHousing", package = "mlbench")
##D ## and transform variables appropriately (for a linear regression)
##D BostonHousing$lstat <- log(BostonHousing$lstat)
##D BostonHousing$rm <- BostonHousing$rm^2
##D ## as well as partitioning variables (for fluctuation testing)
##D BostonHousing$chas <- factor(BostonHousing$chas, levels = 0:1, 
##D                              labels = c("no", "yes"))
##D BostonHousing$rad <- factor(BostonHousing$rad, ordered = TRUE)
##D 
##D ## Original function to interface
##D set.seed(290875)
##D mob(medv ~ lstat + rm | zn + indus + chas + nox + age + dis + rad + tax + crim + b + ptratio,
##D     control = mob_control(minsplit = 40), data = BostonHousing, 
##D     model = linearModel)
##D 
##D ## The interface puts data as first parameter
##D set.seed(290875)
##D ntbt_mob(BostonHousing, 
##D          medv ~ lstat + rm | zn + indus + chas + nox + age + dis + rad + tax + crim + b + ptratio,
##D          control = mob_control(minsplit = 40), model = linearModel)
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(290875)
##D BostonHousing %>%
##D   ntbt_mob(medv ~ lstat + rm | zn + indus + chas + nox + age + dis + rad + tax + crim + b + ptratio,
##D            control = mob_control(minsplit = 40), model = linearModel)
## End(Not run)



