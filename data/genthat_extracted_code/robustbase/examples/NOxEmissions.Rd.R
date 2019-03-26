library(robustbase)


### Name: NOxEmissions
### Title: NOx Air Pollution Data
### Aliases: NOxEmissions
### Keywords: datasets

### ** Examples

data(NOxEmissions)
plot(LNOx ~ LNOxEm, data = NOxEmissions, cex = 0.25, col = "gray30")

## Not run: 
##D ## these take too much time --
##D  ## p = 340  ==> already Least Squares is not fast
##D  (lmNOx <- lm(LNOx ~ . ,data = NOxEmissions))
##D  plot(lmNOx) #->  indication of 1 outlier
##D 
##D  M.NOx <- MASS::rlm(LNOx ~ . , data = NOxEmissions)
##D  ## M-estimation works
##D  ## whereas  MM-estimation fails:
##D  try(MM.NOx <- MASS::rlm(LNOx ~ . , data = NOxEmissions, method = "MM"))
##D  ## namely because S-estimation fails:
##D  try(lts.NOx <- ltsReg(LNOx ~ . , data = NOxEmissions))
##D  try(lmR.NOx <- lmrob (LNOx ~ . , data = NOxEmissions))
## End(Not run)



