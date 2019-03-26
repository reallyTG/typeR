library(mosaicCore)


### Name: coverage
### Title: Interval statistics
### Aliases: coverage interval_statistics ci.mean ci.median ci.sd ci.prop
### Keywords: stats

### ** Examples

# The central 95% interval
df_stats(hp ~ cyl, data = mtcars, c95 = coverage(0.95))
# The confidence interval on the mean
df_stats(hp ~ cyl, data = mtcars, mean, ci.mean)
# What fraction of cars have 6 cylinders?
df_stats(mtcars, ~ cyl, six_cyl_prop = ci.prop(success = 6, level = 0.90))
# Use without `df_stats()` (rare)
ci.mean(mtcars$hp)




