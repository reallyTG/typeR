library(tolerance)


### Name: K.factor
### Title: Estimating K-factors for Tolerance Intervals Based on Normality
### Aliases: K.factor
### Keywords: file

### ** Examples
 
## Showing the effect of the Howe, Weissberg-Beatty, 
## and exact estimation methods as the sample size increases.

K.factor(10, P = 0.95, side = 2, method = "HE")
K.factor(10, P = 0.95, side = 2, method = "WBE")
K.factor(10, P = 0.95, side = 2, method = "EXACT", m = 50)

K.factor(100, P = 0.95, side = 2, method = "HE")
K.factor(100, P = 0.95, side = 2, method = "WBE")
K.factor(100, P = 0.95, side = 2, method = "EXACT", m = 50)




