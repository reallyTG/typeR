library(recipes)


### Name: step_pls
### Title: Partial Least Squares Feature Extraction
### Aliases: step_pls tidy.step_pls
### Keywords: datagen

### ** Examples

data(biomass)

biomass_tr <- biomass[biomass$dataset == "Training",]
biomass_te <- biomass[biomass$dataset == "Testing",]

pls_rec <- recipe(HHV ~ ., data = biomass_tr) %>%
  step_rm(sample, dataset) %>%
  step_center(all_predictors()) %>%
  step_scale(all_predictors()) %>%
  # If the outcome(s) need standardization, do it in separate
  # steps with skip = FALSE so that new data where the
  # outcome is missing can be processed.
  step_center(all_outcomes(), skip = TRUE) %>%
  step_scale(all_outcomes(), skip = TRUE) %>%
  step_pls(all_predictors(), outcome = "HHV")

pls_rec <- prep(pls_rec, training = biomass_tr, retain = TRUE)

pls_test_scores <- bake(pls_rec, new_data = biomass_te[, -8])

tidy(pls_rec, number = 6)



