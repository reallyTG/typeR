library(mlr)


### Name: makeMeasure
### Title: Construct performance measure.
### Aliases: makeMeasure Measure

### ** Examples

f = function(task, model, pred, extra.args)
  sum((pred$data$response - pred$data$truth)^2)
makeMeasure(id = "my.sse", minimize = TRUE, properties = c("regr", "response"), fun = f)



