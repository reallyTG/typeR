library(DeclareDesign)


### Name: set_diagnosands
### Title: Set the diagnosands for a design
### Aliases: set_diagnosands

### ** Examples


design <-
declare_population(data = sleep) +
  declare_estimand(mean_outcome = mean(extra)) +
  declare_sampling(n = 10) +
  declare_estimator(extra ~ 1, estimand = "mean_outcome",
     term = '(Intercept)', model = lm_robust)

diagnosands <- declare_diagnosands(
  median_bias = median(estimate - estimand), keep_defaults = FALSE)

design <- set_diagnosands(design, diagnosands)

## Not run: 
##D diagnose_design(design)
## End(Not run)




