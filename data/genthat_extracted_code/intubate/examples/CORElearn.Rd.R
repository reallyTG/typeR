library(intubate)


### Name: CORElearn
### Title: Interfaces for CORElearn package for data science pipelines.
### Aliases: ntbt_attrEval ntbt_CoreModel ntbt_discretize ntbt_ordEval
### Keywords: intubate magrittr CORElearn attrEval CoreModel discretize
###   ordEval

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(CORElearn)
##D 
##D ## ntbt_attrEval: Attribute evaluation
##D ## Original function to interface
##D attrEval(Species ~ ., iris, estimator = "ReliefFexpRank", ReliefIterations = 30)
##D 
##D ## The interface puts data as first parameter
##D ntbt_attrEval(iris, Species ~ ., estimator = "ReliefFexpRank", ReliefIterations = 30)
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_attrEval(Species ~ ., estimator = "ReliefFexpRank", ReliefIterations = 30)
##D 
##D ## ntbt_CoreModel: Build a classification or regression model
##D trainIdxs <- sample(x=nrow(iris), size=0.7*nrow(iris), replace=FALSE)
##D testIdxs <- c(1:nrow(iris))[-trainIdxs]
##D 
##D ## Original function to interface
##D CoreModel(Species ~ ., iris[trainIdxs,], model = "rf",
##D           selectionEstimator = "MDL", minNodeWeightRF = 5,
##D           rfNoTrees = 100, maxThreads = 1)
##D 
##D ## The interface puts data as first parameter
##D ntbt_CoreModel(iris[trainIdxs,], Species ~ ., model = "rf",
##D                selectionEstimator = "MDL", minNodeWeightRF = 5,
##D                rfNoTrees = 100, maxThreads = 1)
##D 
##D ## so it can be used easily in a pipeline.
##D iris[trainIdxs,] %>%
##D   ntbt_CoreModel(Species ~ ., model = "rf",
##D                  selectionEstimator = "MDL", minNodeWeightRF = 5,
##D                  rfNoTrees = 100, maxThreads = 1)
##D 
##D ## ntbt_discretize: Discretization of numeric attributes
##D ## Original function to interface
##D discretize(Species ~ ., iris, method = "greedy", estimator = "ReliefFexpRank")
##D 
##D ## The interface puts data as first parameter
##D ntbt_discretize(iris, Species ~ ., method = "greedy", estimator = "ReliefFexpRank")
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_discretize(Species ~ ., method = "greedy", estimator = "ReliefFexpRank")
##D 
##D ## ntbt_ordEval: Evaluation of ordered attributes
##D dat <- ordDataGen(200)
##D 
##D ## Original function to interface
##D ordEval(class ~ ., dat, ordEvalNoRandomNormalizers=100)
##D 
##D ## The interface puts data as first parameter
##D ntbt_ordEval(dat, class ~ ., ordEvalNoRandomNormalizers=100)
##D 
##D ## so it can be used easily in a pipeline.
##D dat %>%
##D   ntbt_ordEval(class ~ ., ordEvalNoRandomNormalizers=100)
## End(Not run)



