library(Countr)


### Name: predict.renewal
### Title: Predict method for renewal objects
### Aliases: predict.renewal

### ** Examples

fn <- system.file("extdata", "McShane_Wei_results_boot.RDS", package = "Countr")
object <- readRDS(fn)
data <- object$data
## old data
predOld.response <- predict(object, type = "response", se.fit = TRUE)
predOld.prob <- predict(object, type = "prob", se.fit = TRUE)

## newData (extracted from old Data)
newData <- head(data)
predNew.response <- predict(object, newdata = newData,
                            type = "response", se.fit = TRUE)
predNew.prob <- predict(object, newdata = newData,
                        type = "prob", se.fit = TRUE)

cbind(head(predOld.response$values),
           head(predOld.response$se$scale),
           head(predOld.response$se$shape),
           predNew.response$values,
           predNew.response$se$scale,
           predNew.response$se$shape)

cbind(head(predOld.prob$values),
      head(predOld.prob$se$scale),
      head(predOld.prob$se$shape),
      predNew.prob$values,
      predNew.prob$se$scale,
      predNew.prob$se$shape)



