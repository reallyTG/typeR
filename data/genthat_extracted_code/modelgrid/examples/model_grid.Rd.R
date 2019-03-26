library(modelgrid)


### Name: model_grid
### Title: Pre-allocate an empty model grid
### Aliases: model_grid train.model_grid

### ** Examples

# Pre-allocate an empty model grid.
model_grid()

## No test: 
library(caret)
library(magrittr)
library(dplyr)
data(GermanCredit)

# Create model grid with two different Random Forest models.
mg <-
  model_grid() %>%
  share_settings(
    y = GermanCredit[["Class"]],
    x = GermanCredit %>% select(-Class),
    metric = "ROC",
    trControl = trainControl(
      method = "cv",
      number = 2,
      summaryFunction = twoClassSummary,
      classProbs = TRUE
    )
  ) %>%
  add_model(
    model_name = "RF",
    method = "rf",
    tuneLength = 3
    ) %>%
  add_model(
    model_name = "RF NZV",
    method = "rf",
    preProc = "nzv",
    tuneGrid = data.frame(mtry = c(2, 10))
    )

# Train all model configurations in model grid.
train(mg)
## End(No test)



