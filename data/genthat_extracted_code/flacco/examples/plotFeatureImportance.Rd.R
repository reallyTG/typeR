library(flacco)


### Name: plotFeatureImportance
### Title: Feature Importance Plot
### Aliases: plotFeatureImportance

### ** Examples

## Not run: 
##D # At the beginning, one needs a list of features, e.g. derived during a
##D # nested feature selection within mlr (see the following 8 steps):
##D library(mlr)
##D library(mlbench)
##D data(Glass)
##D 
##D # (1) Create a classification task:
##D classifTask = makeClassifTask(data = Glass, target = "Type")
##D 
##D # (2) Define the model (here, a classification tree):
##D lrn = makeLearner(cl = "classif.rpart")
##D 
##D # (3) Define the resampling strategy, which is supposed to be used within 
##D # each inner loop of the nested feature selection:
##D innerResampling = makeResampleDesc("Holdout")
##D 
##D # (4) What kind of feature selection approach should be used? Here, we use a
##D # sequential backward strategy, i.e. starting from a model with all features,
##D # in each step the feature decreasing the performance measure the least is
##D # removed from the model:
##D ctrl = makeFeatSelControlSequential(method = "sbs")
##D 
##D # (5) Wrap the original model (see (2)) in order to allow feature selection:
##D wrappedLearner = makeFeatSelWrapper(learner = lrn,
##D   resampling = innerResampling, control = ctrl)
##D 
##D # (6) Define a resampling strategy for the outer loop. This is necessary in
##D # order to assess whether the selected features depend on the underlying
##D # fold:
##D outerResampling = makeResampleDesc(method = "CV", iters = 10L)
##D 
##D # (7) Perform the feature selection:
##D featselResult = resample(learner = wrappedLearner, task = classifTask,
##D   resampling = outerResampling, models = TRUE)
##D 
##D # (8) Extract the features, which were selected during each iteration of the
##D # outer loop (i.e. during each of the 5 folds of the cross-validation):
##D featureList = lapply(featselResult$models, 
##D   function(mod) getFeatSelResult(mod)$x)
## End(Not run)

########################################################################

# Now, one could inspect the features manually:
featureList

# Alternatively, one might use visual means such as the feature
# importance plot:
plotFeatureImportance(featureList)



