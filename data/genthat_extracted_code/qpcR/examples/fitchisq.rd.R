library(qpcR)


### Name: fitchisq
### Title: The chi-square goodness-of-fit
### Aliases: fitchisq
### Keywords: models nonlinear

### ** Examples

## Using replicates by making a 'replist'.
ml1 <- modlist(reps, fluo = 2:5)
rl1 <- replist(ml1, group = c(1, 1, 1, 1))
fitchisq(rl1[[1]])

## Using single model with added error.
m1 <- pcrfit(reps, 1, 2, l5)
fitchisq(m1, 0.1)



