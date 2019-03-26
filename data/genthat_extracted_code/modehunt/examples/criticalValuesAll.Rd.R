library(modehunt)


### Name: criticalValuesAll
### Title: Compute critical values based on the set of all intervals
### Aliases: criticalValuesAll
### Keywords: htest nonparametric

### ** Examples

## compute critical values and compare to those in cvModeAll 
## (to see output in R, press CTRL + W)
cv1 <- criticalValuesAll(n = 200, alpha = 0.05, M = 10 ^ 2, display = 1, path = NA)
data(cvModeAll)
cv2 <- cvModeAll[cvModeAll$alpha == 0.05 & cvModeAll$n == 200, 3:4]
rbind(cv1, cv2)



