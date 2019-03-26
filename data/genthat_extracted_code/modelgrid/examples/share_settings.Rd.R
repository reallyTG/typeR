library(modelgrid)


### Name: share_settings
### Title: Set shared settings of a model grid
### Aliases: share_settings

### ** Examples

library(magrittr)
library(caret)
library(dplyr)
data(GermanCredit)

# Pre-allocate empty model grid.
models <- model_grid()

# Set shared settings of model grid.
models %>%
  share_settings(
    y = GermanCredit[["Class"]],
    x = GermanCredit %>% select(-Class),
    metric = "ROC",
    preProc = c("center", "scale", "pca"),
    trControl = trainControl(
      method = "cv",
      number = 5,
      summaryFunction = twoClassSummary,
      classProbs = TRUE
      )
  )



