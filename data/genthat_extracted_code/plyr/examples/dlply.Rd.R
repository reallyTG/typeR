library(plyr)


### Name: dlply
### Title: Split data frame, apply function, and return results in a list.
### Aliases: dlply
### Keywords: manip

### ** Examples

linmod <- function(df) {
  lm(rbi ~ year, data = mutate(df, year = year - min(year)))
}
models <- dlply(baseball, .(id), linmod)
models[[1]]

coef <- ldply(models, coef)
with(coef, plot(`(Intercept)`, year))
qual <- laply(models, function(mod) summary(mod)$r.squared)
hist(qual)



