library(pipeliner)


### Name: ml_pipline_builder
### Title: Build machine learning pipelines - object oriented API
### Aliases: ml_pipline_builder

### ** Examples

data <- faithful

lm_pipeline <- ml_pipline_builder()

lm_pipeline$transform_features(function(df) {
  data.frame(x1 = (df$waiting - mean(df$waiting)) / sd(df$waiting))
})

lm_pipeline$transform_response(function(df) {
  data.frame(y = (df$eruptions - mean(df$eruptions)) / sd(df$eruptions))
})

lm_pipeline$inv_transform_response(function(df) {
  data.frame(pred_eruptions = df$pred_model * sd(df$eruptions) + mean(df$eruptions))
})

lm_pipeline$estimate_model(function(df) {
  lm(y ~ 0 + x1, df)
})

lm_pipeline$fit(data)
head(lm_pipeline$predict(data))
#    eruptions waiting         x1 pred_model pred_eruptions
#  1     3.600      79  0.5960248  0.5369058       4.100592
#  2     1.800      54 -1.2428901 -1.1196093       2.209893
#  3     3.333      74  0.2282418  0.2056028       3.722452
#  4     2.283      62 -0.6544374 -0.5895245       2.814917
#  5     4.533      85  1.0373644  0.9344694       4.554360
#  6     2.883      55 -1.1693335 -1.0533487       2.285521




