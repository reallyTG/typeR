library(deducorrect)


### Name: correctWithRules
### Title: Deterministic correction
### Aliases: correctWithRules

### ** Examples

## Some example data
dat <- data.frame(
   x = c(NA, 2, 0,-10),
   y = c(1, NA,NA, 6)
)

## a few rules
u <- correctionRules(expression(
   if ( is.na(x) ) x <- 0,
   if ( x == 0 && is.na(y) ) y <- 0,
   if ( is.na(y) ) y <- 1,
   if ( x < 0 ) y <- 0
))

correctWithRules(u,dat)



