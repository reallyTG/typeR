library(MRFcov)


### Name: predict_MRF
### Title: Predict training observations from fitted MRFcov models
### Aliases: predict_MRF

### ** Examples

## No test: 
data("Bird.parasites")
# Fit a model to a subset of the data (training set)
CRFmod <- MRFcov(data = Bird.parasites[1:300, ], n_nodes = 4, family = "binomial")

# If covariates are included, prep the dataset for gathering predictions
prepped_pred <- prep_MRF_covariates(Bird.parasites[301:nrow(Bird.parasites), ], n_nodes = 4)

# Predict occurrences for the remaining subset (test set)
predictions <- predict_MRF(data = prepped_pred, MRF_mod = CRFmod)

# Visualise predicted occurrences for nodes in the test set
predictions$Binary_predictions

# Predicting spatial MRFs requires the user to supply the spatially augmented dataset
data("Bird.parasites")
Latitude <- sample(seq(120, 140, length.out = 100), nrow(Bird.parasites), TRUE)
Longitude <- sample(seq(-19, -22, length.out = 100), nrow(Bird.parasites), TRUE)
coords <- data.frame(Latitude = Latitude, Longitude = Longitude)
CRFmod_spatial <- MRFcov_spatial(data = Bird.parasites, n_nodes = 4,
                                family = 'binomial', coords = coords)
predictions <- predict_MRF(data = CRFmod_spatial$mrf_data,
                          prep_covariates  = FALSE,
                          MRF_mod = CRFmod_spatial)
## End(No test)




