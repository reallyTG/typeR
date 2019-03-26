library(healthcareai)


### Name: explore
### Title: Explore a model's "reasoning" via counterfactual predictions
### Aliases: explore

### ** Examples

# First, we need a model on which to make counterfactual predictions
set.seed(5176)
m <- machine_learn(pima_diabetes, patient_id, outcome = diabetes,
                   tune = FALSE, models = "xgb")

# By default, the four most important features are varied, with numeric
# features taking their 5, 25, 50, 75, and 95 percentile values, and
# categoricals taking their five most common values. Others features are
# held at their median and modal values for numeric and categorical features,
# respectively. This can provide insight into how the model responds to
# different features
explore(m)

# It is easy to plot counterfactual predictions. By default, only the two most
# important features are plotted over; see `?plot.explore_df` for
# customization options
explore(m) %>%
  plot()

# You can specify which features vary and what values they take in a variety of
# ways. For example, you could vary only "weight_class" and "plasma_glucose"
explore(m, vary = c("weight_class", "plasma_glucose"))

# You can also control what values non-varying features take.
# For example, if you want to simulate alternative scenarios for patient 321
patient321 <- dplyr::filter(pima_diabetes, patient_id == 321)
patient321
explore(m, hold = patient321)

# Here is an example in which both the varying and non-varying feature values
# are explicitly specified.
explore(m,
        vary = list(weight_class = c("normal", "overweight", "obese"),
                    plasma_glucose = seq(60, 200, 10)),
        hold = list(pregnancies = 2,
                    pedigree = .5,
                    age = 25,
                    insulin = NA,
                    skinfold = NA,
                    diastolic_bp = 85)) %>%
  plot()



