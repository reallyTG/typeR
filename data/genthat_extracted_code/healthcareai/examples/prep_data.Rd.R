library(healthcareai)


### Name: prep_data
### Title: Prepare data for machine learning
### Aliases: prep_data

### ** Examples

d_train <- pima_diabetes[1:700, ]
d_test <- pima_diabetes[701:768, ]

# Prep data. Ignore patient_id (identifier) and treat diabetes as outcome
d_train_prepped <- prep_data(d = d_train, patient_id, outcome = diabetes)

# Prep test data by reapplying the same transformations as to training data
d_test_prepped <- prep_data(d_test, recipe = d_train_prepped)

# View the transformations applied and the prepped data
d_test_prepped

# Customize preparations:
prep_data(d = d_train, patient_id, outcome = diabetes,
          impute = list(numeric_method = "bagimpute",
                        nominal_method = "bagimpute"),
          collapse_rare_factors = FALSE, center = TRUE, scale = TRUE,
          make_dummies = FALSE, remove_near_zero_variance = .02)

# Picking reference levels:
# Dummy variables are not created for reference levels. Mode levels are
# chosen as reference levels by default. The list given to `make_dummies`
# sets the reference level for `weight_class` to "normal". All other values
# in `weight_class` will create a new dummy column that is relative to normal.
prep_data(d = d_train, patient_id, outcome = diabetes,
          make_dummies = list(weight_class = "normal"))

# `prep_data` also handles date and time features by default:
d <-
  pima_diabetes %>%
  cbind(
    admitted_DTS = seq(as.POSIXct("2005-1-1 0:00"),
                       length.out = nrow(pima_diabetes), by = "hour")
  )
d_train = d[1:700, ]
prep_data(d = d_train)

# Customize how date and time features are handled:
# When `convert_dates` is set to "categories", the prepped data will be more
# readable, but will be wider.
prep_data(d = d_train, convert_dates = "categories")

# PCA to reduce training time:
## Not run: 
##D start_time <- Sys.time()
##D pd <- prep_data(pima_diabetes, patient_id, outcome = diabetes, PCA = FALSE)
##D ncol(pd)
##D m <- machine_learn(pd, patient_id, outcome = diabetes)
##D end_time <- Sys.time()
##D end_time - start_time
##D 
##D start_time <- Sys.time()
##D pcapd <- prep_data(pima_diabetes, patient_id, outcome = diabetes, PCA = TRUE)
##D ncol(pcapd)
##D m <- machine_learn(pcapd, patient_id, outcome = diabetes)
##D Sys.time() - start_time
## End(Not run)



