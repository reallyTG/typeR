library(Momocs)


### Name: sample_frac
### Title: Sample a fraction of shapes
### Aliases: sample_frac

### ** Examples


# samples 50% of the bottles no matter their type
sample_frac(bot, 0.5)
# 80% bottles of beer and of whisky
table(sample_frac(bot, 0.8, fac="type")$fac)
# bootstrap the same number of bootles of each type but with replacement
table(names(sample_frac(bot, 1, replace=TRUE)))




