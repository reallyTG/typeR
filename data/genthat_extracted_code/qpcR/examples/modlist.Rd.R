library(qpcR)


### Name: modlist
### Title: Create nonlinear models from a dataframe and coerce them into a
###   list
### Aliases: modlist
### Keywords: models nonlinear

### ** Examples

## Calculate efficiencies and ct values 
## for each run in the 'reps' data, 
## subtract baseline using mean of 
## first 8 cycles.
ml1 <- modlist(reps, model = l5, baseline = "mean")
getPar(ml1, type = "curve")

## 'Crossing points' for the first 3 runs (normalized)
##  and using best model from Akaike weights.
ml2 <- modlist(reps, 1, 2:5, model = l5, norm = TRUE, 
               opt = TRUE, optPAR = list(crit = "weights"))
sapply(ml2, function(x) efficiency(x, plot = FALSE)$cpD2)

## Convert a single run to a 'modlist'.
m <- pcrfit(reps, 1, 2, l5)
ml3 <- modlist(m)

## Using the 'testdat' set
## include failed fits.
ml4 <- modlist(testdat, 1, 2:9,  model = l5)
plot(ml4, which = "single")

## Remove failed fits and update a label vector.
GROUP <- c("g1s1", "g1s2", "g1s3", "g1s4", "g1c1", "g1c2", "g1c3", "g1c4") 
ml5 <- modlist(testdat, 1, 2:9,  model = l5, labels = GROUP, remove = "KOD")
plot(ml5, which = "single")

## Smoothing by EMA and alpha = 0.8.
ml6 <- modlist(reps, model = l5, smooth = "ema",
               smoothPAR = list(alpha = 0.5))
plot(ml6)

## Not run: 
##D ## Use one of the mechanistic models
##D ## get D0 values.
##D ml7 <- modlist(reps, model = mak3)
##D sapply(ml7, function(x) coef(x)[1])
##D 
##D ## Exclude first sample in each 
##D ## replicate group of dataset 'reps'.
##D ml8 <- modlist(reps, exclude = ".1")
##D plot(ml8, which = "single")
##D 
##D ## Using weighted fitting:
##D ## weighted by inverse residuals.
##D ml9 <- modlist(reps, weights = "1/abs(resid)")
##D plot(ml9, which = "single")
##D 
##D ## Use linear model of the first 10
##D ## cycles for baselining.
##D ml10 <- modlist(reps, basecyc = 1:10, baseline = "lin")
##D plot(ml10)
##D 
##D ## Use a single value for baselining.
##D ml11 <- modlist(reps, basecyc = 1:10, baseline = 0.5)
##D plot(ml11)
## End(Not run)



