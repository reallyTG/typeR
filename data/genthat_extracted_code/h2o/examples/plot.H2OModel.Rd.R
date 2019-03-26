library(h2o)


### Name: plot.H2OModel
### Title: Plot an H2O Model
### Aliases: plot.H2OModel

### ** Examples

## No test: 
if (requireNamespace("mlbench", quietly=TRUE)) {
    library(h2o)
    h2o.init()

    df <- as.h2o(mlbench::mlbench.friedman1(10000,1))
    rng <- h2o.runif(df, seed=1234)
    train <- df[rng<0.8,]
    valid <- df[rng>=0.8,]

    gbm <- h2o.gbm(x = 1:10, y = "y", training_frame = train, validation_frame = valid,
                   ntrees=500, learn_rate=0.01, score_each_iteration = TRUE)
    plot(gbm)
    plot(gbm, timestep = "duration", metric = "deviance")
    plot(gbm, timestep = "number_of_trees", metric = "deviance")
    plot(gbm, timestep = "number_of_trees", metric = "rmse")
    plot(gbm, timestep = "number_of_trees", metric = "mae")
}
## End(No test)



