library(modehunt)


### Name: criticalValuesApprox
### Title: Compute critical values for (1) the original test statistic with
###   or without additive correction, based on the aprroximating set of
###   intervals and (2) for the block procedure
### Aliases: criticalValuesApprox criticalValuesBlock
### Keywords: htest nonparametric

### ** Examples

## compute critical values and compare to those in cvModeAll and cvModeBlock
## (to see output in R, press CTRL + W)
cv <- criticalValuesApprox(n = 200, d0 = 2, m0 = 10, fm = 2, 
     alpha = 0.05, gam = 2, tail = 10, M = 10 ^ 2, display = 1, path = NA)
cv1 <- cv$approx; cv2 <- cv$block

data(cvModeApprox); data(cvModeBlock)
cv3 <- cvModeApprox[cvModeApprox$alpha == 0.05 & cvModeApprox$n == 200, 3:4]
cv4 <- cvModeBlock[cvModeBlock$alpha == 0.05 & cvModeBlock$n == 200, 3:6]
rbind(cv1, cv3)
rbind(cv2, cv4)



