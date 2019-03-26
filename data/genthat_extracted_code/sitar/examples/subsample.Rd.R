library(sitar)


### Name: subsample
### Title: Sample from SITAR dataset
### Aliases: subsample

### ** Examples


## draw 50% random sample
s50 <- subsample(age, id, heights, prob=0.5)

## truncate age range to 7-12 for 50% of subjects
t50 <- subsample(age, id, heights, prob=0.5, xlim=c(7, 12))




