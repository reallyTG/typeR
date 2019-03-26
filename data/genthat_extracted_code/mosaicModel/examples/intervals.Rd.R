library(mosaicModel)


### Name: coverage
### Title: Interval statistics for use with df_stats()
### Aliases: coverage ci.mean ci.median ci.sd

### ** Examples

cover <- coverage(0.95)
df_stats(hp ~ cyl, data = mtcars, c95 = cover)




