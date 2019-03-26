library(LDPD)


### Name: ARestimate
### Title: Accuracy Ratio estimation
### Aliases: ARestimate
### Keywords: PD calibration Accurancy Ratio Gini

### ** Examples


pd.cond <- c(0.1, 0.05, 0.025, 0.01, 0.001)  # PD for given rating class 
portf.uncond <- c(10, 20, 30, 50, 10)  # Number of borrowers in each rating class
ARestimate(pd.cond, portf.uncond, rating.type = "RATING")
  



