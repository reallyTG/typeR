library(SuperLearner)


### Name: create.Learner
### Title: Factory for learner wrappers
### Aliases: create.Learner

### ** Examples

## Not run: 
##D # Create a randomForest learner with ntree set to 1000 rather than the
##D # default of 500.
##D create_rf = create.Learner("SL.randomForest", list(ntree = 1000))
##D create_rf
##D sl = SuperLearner(Y = Y, X = X, SL.library = create_rf$names, family = binomial())
##D sl
##D # Clean up global environment.
##D rm(list = create_rf$names)
##D # Create a randomForest learner that optimizes over mtry
##D create_rf = create.Learner("SL.randomForest",
##D                      tune = list(mtry = round(c(1, sqrt(ncol(X)), ncol(X)))))
##D create_rf
##D sl = SuperLearner(Y = Y, X = X, SL.library = create_rf$names, family = binomial())
##D sl
##D # Clean up global environment.
##D rm(list = create_rf$names)
##D 
##D # Optimize elastic net over alpha, with a custom environment and detailed names.
##D learners = new.env()
##D create_enet = create.Learner("SL.glmnet", env = learners, detailed_names = T,
##D                            tune = list(alpha = seq(0, 1, length.out=5)))
##D create_enet
##D # List the environment to review what functions were created.
##D ls(learners)
##D # We can simply list the environment to specify the library.
##D sl = SuperLearner(Y = Y, X = X, SL.library = ls(learners), family = binomial(), env = learners)
##D sl
## End(Not run)




