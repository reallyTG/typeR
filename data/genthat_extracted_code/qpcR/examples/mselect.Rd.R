library(qpcR)


### Name: mselect
### Title: Sigmoidal model selection by different criteria
### Aliases: mselect
### Keywords: models nonlinear

### ** Examples

## Choose best model based on F-tests 
## on the corresponding nested models.
m1 <- pcrfit(reps, 1, 2, l4)
m2 <- mselect(m1)
summary(m2)  ## Converted to l7 model!

## Use Akaike weights on non-nested models
## compare to original model.
m2 <- mselect(m1, fctList = list(l4, b5, cm3), crit = "weights")
summary(m2) ## Converted to b5 model!

## Try all sigmoidal models.
m3 <- pcrfit(reps, 1, 20, l4)
mselect(m3, do.all = TRUE) ## l7 wins by far!

## On replicated data using reduced chi-square.
ml1 <- modlist(reps, fluo = 2:5, model = l4)
rl1 <- replist(ml1, group = c(1, 1, 1, 1))
mselect(rl1, crit = "chisq")  ## converted to l6!



