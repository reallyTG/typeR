library(modelgrid)


### Name: consolidate_model
### Title: Consolidate model settings to a complete caret model
###   specification
### Aliases: consolidate_model

### ** Examples

library(magrittr)
library(dplyr)
library(caret)

# create model grid.
mg <-
  model_grid() %>%
  share_settings(y = iris[["Species"]],
                 x = iris %>% select(-Species),
                 trControl = trainControl()) %>%
  add_model("FunkyForest", method = "rf",
            preProc = c("center", "scale", "pca"),
            custom_control = list(preProcOptions = list(thresh = 0.8)))

# consolidate all settings to complete caret model specification.
consolidate_model(mg$shared_settings, mg$models$FunkyForest)



