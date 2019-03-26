library(pipeliner)


### Name: predict.ml_pipeline
### Title: Predict method for ML pipelines
### Aliases: predict.ml_pipeline

### ** Examples

data <- faithful

lm_pipeline <-
  pipeline(
    data,
    estimate_model(function(df) {
      lm(eruptions ~ 1 + waiting, df)
    })
  )

in_sample_predictions <- predict(lm_pipeline, data)
head(in_sample_predictions)
# [1] 4.100592 2.209893 3.722452 2.814917 4.554360 2.285521



