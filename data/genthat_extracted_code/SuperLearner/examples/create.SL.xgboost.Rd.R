library(SuperLearner)


### Name: create.SL.xgboost
### Title: Factory for XGBoost SL wrappers
### Aliases: create.SL.xgboost

### ** Examples


# Create a new environment to store the learner functions.
# This keeps the global environment organized.
sl_env = new.env()
# Create 2 * 2 * 1 * 3 = 12 combinations of hyperparameters.
tune = list(ntrees = c(100, 500), max_depth = c(1, 2), minobspernode = 10,
            shrinkage = c(0.1, 0.01, 0.001))
# Generate a separate learner for each combination.
xgb_grid = create.SL.xgboost(tune = tune, env = sl_env)
# Review the function configurations.
xgb_grid
# Attach the environment so that the custom learner functions can be accessed.
attach(sl_env)
## Not run: 
##D sl = SuperLearner(Y = Y, X = X, SL.library = xgb_grid$names)
## End(Not run)
detach(sl_env)



