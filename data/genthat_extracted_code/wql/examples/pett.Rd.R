library(wql)


### Name: pett
### Title: Nonparametric Change-Point Detection
### Aliases: pett
### Keywords: nonparametric ts

### ** Examples


# data from Pettitt (1979, Table 1):
y <- c(-1.05, 0.96, 1.22, 0.58, -0.98, -0.03, -1.54, -0.71, -0.35, 0.66, 
0.44, 0.91, -0.02, -1.42, 1.26, -1.02, -0.81, 1.66, 1.05, 0.97, 2.14, 1.22, 
-0.24, 1.60, 0.72, -0.12, 0.44, 0.03, 0.66, 0.56, 1.37, 1.66, 0.10, 0.80, 
1.29, 0.49, -0.07, 1.18, 3.29, 1.84)
pett(y) # K=232, p=0.0146, change-point=17, the same results as Pettitt
# identify the year of a change-point in an annual time series:
pett(Nile)
# apply to a matrix time series:
y <- ts.intersect(Nile, LakeHuron)
pett(y)
pett(y, plot = TRUE, xlab = "Change-point")
legend("topleft", legend = "p < 0.05", pch = 19, bty="n")
# note how a smooth trend can disguise a change-point:
# smooth trend with change-point at 75
y <- 1:100 + c(rep(0, 75), rep(10, 25)) 
pett(y) # gives 50, erroneously
pett(residuals(lm(y~I(1:100)))) # removing trend gives 75, correctly




