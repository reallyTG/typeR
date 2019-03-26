library(bnnSurvival)


### Name: bnnSurvival
### Title: Bagged k-nearest neighbors survival prediction
### Aliases: bnnSurvival

### ** Examples

require(bnnSurvival)

## Use only 1 core
options(mc.cores = 1)

## Load a dataset and split in training and test data
require(survival)
n <- nrow(veteran)
idx <- sample(n, 2/3*n)
train_data <- veteran[idx, ]
test_data <- veteran[-idx, ]

## Create model with training data and predict for test data
model <- bnnSurvival(Surv(time, status) ~ trt + karno + diagtime + age + prior, train_data, 
                     k = 20, num_base_learners = 10, num_features_per_base_learner = 3)
result <- predict(model, test_data)

## Plot survival curve for the first observations
plot(timepoints(result), predictions(result)[1, ])




