library(healthcareai)


### Name: predict.model_list
### Title: Get predictions
### Aliases: predict.model_list

### ** Examples

### Data prep and model training ###
####################################

set.seed(7510)
# Split the first 200 rows in pima_diabetes into a model-training dataset
# containing 3/4 of the data and a test dataset containing 1/4 of the data.
d <- split_train_test(pima_diabetes[1:200, ], diabetes, .75)

# Prep the training data for model training and train regularized regression
# and extreme gradient boosted models
models <-
  d$train %>%
  prep_data(patient_id, outcome = diabetes) %>%
  flash_models(outcome = diabetes, models = c("glm", "xgb"))

### Making predictions ###
##########################

# Make prediction on test data using the model that performed best in
# cross validation during model training. Before predictions are made, the test
# data is automatically prepared the same way the training data was.
predictions <- predict(models, newdata = d$test)
predictions
evaluate(predictions)
plot(predictions)

### Outcome class predictions ###
#################################

# If you want class predictions in addition to predicted probabilities for
# a classification model, specify outcome_groups. The number passed to
# outcome groups is the cost of a false negative relative to a false positive.
# This example specifies that one missed detection is as bad as ten false
# alarms, and the resulting confusion matrix reflects this preference.
class_preds <- predict(models, newdata = d$test, outcome_groups = 10)
table(actual = class_preds$diabetes, predicted = class_preds$predicted_group)

# You can extract the threshold used to separate predicted Y from predicted N
get_cutoffs(class_preds)

# And you can visualize that cutoff by simply plotting the predictions
plot(class_preds)

### Risk stratification ###
###########################

# Alternatively, you can stratify observations into risk groups by specifying
# the risk_groups parameter. For example, this creates five risk groups
# with custom names. Risk group assignment is based on the distribution of
# predicted probabilities in model training. This is useful because it preserves
# a consistent notion of risk; for example, if you make daily predictions and
# one day happens to contain only low-risk patients, those patients will all
# be classified as low risk. Over the long run, group sizes will be consistent,
# but in any given round of predictions they may differ. If you want fixed
# group sizes, see the following examples.
predict(models, d$test,
        risk_groups = c("very low", "low", "medium", "high", "very high")) %>%
  plot()

### Fixed size groups ###
#########################

# If you want groups of fixed sizes, e.g. say you have capacity to admit the three
# highest-risk patients, treat the next five, and have to discharge the remainder,
# you can use predicted probabilities to do that. One way to do that is to
# arrange the predictions data frame in descending order of risk, and then use the
# row numbers to stratify patients
library(dplyr)
predict(models, d$test) %>%
  arrange(desc(predicted_diabetes)) %>%
  mutate(action = case_when(
    row_number() <= 3 ~ "admit",
    row_number() <= 8 ~ "treat",
    TRUE ~ "discharge"
  )) %>%
  select(predicted_diabetes, action, everything())

# Finally, if you want a fixed group size that is further down on the risk
# scale, you can achieve that with a combination of risk groups and the
# stratifying approach in the last example. For example, say you have capacity
# to admit 5 patients, but you don't want to admit patients in the top 10% of
# risk scores.
predict(models, d$test,
        risk_groups = c("risk acceptable" = 90, "risk too high" = 10)) %>%
  filter(predicted_group == "risk acceptable") %>%
  top_n(n = 5, wt = predicted_diabetes)



