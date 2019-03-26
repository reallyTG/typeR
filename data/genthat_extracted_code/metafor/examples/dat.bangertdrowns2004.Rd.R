library(metafor)


### Name: dat.bangertdrowns2004
### Title: Studies on the Effectiveness of Writing-to-Learn Interventions
### Aliases: dat.bangertdrowns2004
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.bangertdrowns2004))

### random-effects model
res <- rma(yi, vi, data=dat)
res



