library(pipeliner)


### Name: pipeline
### Title: Build machine learning pipelines - functional API
### Aliases: pipeline

### ** Examples

data <- faithful

lm_pipeline <-
  pipeline(
    data,
    transform_features(function(df) {
      data.frame(x1 = (df$waiting - mean(df$waiting)) / sd(df$waiting))
    }),

    transform_response(function(df) {
      data.frame(y = (df$eruptions - mean(df$eruptions)) / sd(df$eruptions))
    }),

    estimate_model(function(df) {
      lm(y ~ 1 + x1, df)
    }),

    inv_transform_response(function(df) {
      data.frame(pred_eruptions = df$pred_model * sd(df$eruptions) + mean(df$eruptions))
    })
  )



