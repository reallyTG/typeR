library(robumeta)


### Name: forest.robu
### Title: Forest Plots for Robust Variance Estimation Meta-Analysis
### Aliases: forest.robu
### Keywords: forest.robu

### ** Examples



# Load data
data(oswald2013.ex1)

# Run intercept only model.
oswald_intercept <- robu(formula = effect.size ~ 1, data = oswald2013.ex1, 
                         studynum = Study, var.eff.size = var.eff.size, 
                         rho = 0.8, small = TRUE)

# Create forest plot. 
forest.robu(oswald_intercept, es.lab = "Crit.Cat", study.lab = "Study", 
            "Effect Size" = effect.size, # optional column
            "Weight" = r.weights)        # optional column




