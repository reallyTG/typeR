library(Momocs)


### Name: sample_n
### Title: Sample n shapes
### Aliases: sample_n

### ** Examples


# samples 5 bottles no matter their type
sample_n(bot, 5)
# 5 bottles of beer and of whisky
table(sample_n(bot, 5, fac="type")$type)
# many repetitions
table(names(sample_n(bot, 400, replace=TRUE)))




