library(seas)


### Name: seas.check
### Title: Check the suitability of a data.frame, or seas.sum for seas
### Aliases: seas.df.check seas.sum.check
### Keywords: utilities

### ** Examples

data(mscdata)
dat <- mksub(mscdata, id=1108447)
str(seas.df.check(dat))

dat.ss <- seas.sum(dat)
str(seas.sum.check(dat.ss, norm="days"))



