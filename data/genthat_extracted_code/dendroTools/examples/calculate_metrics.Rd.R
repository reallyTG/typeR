library(dendroTools)


### Name: calculate_metrics
### Title: calculate_metrics
### Aliases: calculate_metrics

### ** Examples

data(example_dataset_1)
test_data <- example_dataset_1[1:30, ]
train_data <- example_dataset_1[31:55, ]
lin_mod <- lm(MVA ~., data = train_data)
train_predicted <- predict(lin_mod, train_data)
test_predicted <- predict(lin_mod, test_data)
train_observed <- train_data[, 1]
test_observed <- test_data[, 1]
calculate_metrics(train_predicted, test_predicted, train_observed,
test_observed, test = test_data, formula = MVA ~.)

test_data <- example_dataset_1[1:20, ]
train_data <- example_dataset_1[21:55, ]
library(brnn)
lin_mod <- brnn(MVA ~., data = train_data)
train_predicted <- predict(lin_mod, train_data)
test_predicted <- predict(lin_mod, test_data)
train_observed <- train_data[, 1]
test_observed <- test_data[, 1]
calculate_metrics(train_predicted, test_predicted, train_observed,
test_observed, test = test_data, formula = MVA ~.)



