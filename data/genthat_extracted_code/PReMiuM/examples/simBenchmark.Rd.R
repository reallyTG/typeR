library(PReMiuM)


### Name: simBenchmark
### Title: Benchmark for simulated examples
### Aliases: simBenchmark
### Keywords: benchmark simulations testing

### ** Examples

## Not run: 
##D # vector of all test datasets allowed by this benchmarking function
##D testDatasets<-c("clusSummaryBernoulliNormal",
##D   "clusSummaryBernoulliDiscreteSmall","clusSummaryCategoricalDiscrete",
##D   "clusSummaryNormalDiscrete","clusSummaryNormalNormal", 
##D   "clusSummaryNormalNormalSpatial","clusSummaryVarSelectBernoulliDiscrete", 
##D   "clusSummaryBernoulliMixed")
##D 
##D # runs profile regression on all datasets and 
##D # computes confusion matrix for each one
##D for (i in 1:length(testDatasets)){
##D   tester<-simBenchmark(testDatasets[i])
##D   print(table(tester[,c(1,3)]))
##D }
##D 
##D 
## End(Not run)



