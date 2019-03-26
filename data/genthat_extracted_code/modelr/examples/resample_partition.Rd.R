library(modelr)


### Name: resample_partition
### Title: Generate an exclusive partitioning of a data frame
### Aliases: resample_partition

### ** Examples

ex <- resample_partition(mtcars, c(test = 0.3, train = 0.7))
mod <- lm(mpg ~ wt, data = ex$train)
rmse(mod, ex$test)
rmse(mod, ex$train)



