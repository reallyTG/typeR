library(mlr)


### Name: makeAggregation
### Title: Specify your own aggregation of measures.
### Aliases: makeAggregation

### ** Examples

# computes the interquartile range on all performance values
test.iqr = makeAggregation(id = "test.iqr", name = "Test set interquartile range",
  properties = "req.test",
  fun = function (task, perf.test, perf.train, measure, group, pred) IQR(perf.test))



