library(mccr)


### Name: mccr
### Title: Calculate the Matthews correlation coefficient (MCC) score
### Aliases: mccr

### ** Examples

set.seed(18)
act <- abs(round(rnorm(100))) %% 2
pred <- abs(round(rnorm(100))) %% 2
mccr(act, pred)



