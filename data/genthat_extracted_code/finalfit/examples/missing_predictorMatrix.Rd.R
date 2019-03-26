library(finalfit)


### Name: missing_predictorMatrix
### Title: Create predictorMatrix for use with mice
### Aliases: missing_predictorMatrix

### ** Examples

library(mice)
library(dplyr)
library(Hmisc)

# Create some extra missing data
## Smoking missing completely at random
set.seed(1)
colon_s$smoking_mcar =
  sample(c("Smoker", "Non-smoker", NA),
  dim(colon_s)[1], replace=TRUE,
  prob = c(0.2, 0.7, 0.1)) %>%
  factor()
Hmisc::label(colon_s$smoking_mcar) = "Smoking (MCAR)"

## Make smoking missing conditional on patient sex
colon_s$smoking_mar[colon_s$sex.factor == "Female"] =
  sample(c("Smoker", "Non-smoker", NA),
	 sum(colon_s$sex.factor == "Female"),
	 replace = TRUE, prob = c(0.1, 0.5, 0.4))

colon_s$smoking_mar[colon_s$sex.factor == "Male"] =
  sample(c("Smoker", "Non-smoker", NA),
	 sum(colon_s$sex.factor == "Male"),
	 replace=TRUE, prob = c(0.15, 0.75, 0.1))
colon_s$smoking_mar = factor(colon_s$smoking_mar)
Hmisc::label(colon_s$smoking_mar) = "Smoking (MAR)"

explanatory = c("age", "sex.factor",
  "nodes", "obstruct.factor", "smoking_mar")
dependent = "mort_5yr"

colon_s %>%
select(dependent, explanatory) %>%
  missing_predictorMatrix(drop_from_imputed =
    c("obstruct.factor", "mort_5yr")) -> predM

colon_s %>%
	select(dependent, explanatory) %>%
	mice(m = 2, predictorMatrix = predM) %>% # e.g. m=10 when for real
	# Run logistic regression on each imputed set
	with(glm(formula(ff_formula(dependent, explanatory)),
					 family="binomial")) %>%
	pool() %>%
	summary(conf.int = TRUE, exponentiate = TRUE) %>%
	# Jiggle into finalfit format
	mutate(explanatory_name = rownames(.)) %>%
	select(explanatory_name, estimate, `2.5 %`, `97.5 %`, p.value) %>%
	condense_fit(estimate_suffix = " (multiple imputation)") %>%
	remove_intercept() -> fit_imputed




