library(riskPredictClustData)


### Name: powerCal
### Title: Calculate the power for testing delta=0
### Aliases: powerCal
### Keywords: method

### ** Examples


 

set.seed(1234567)
mu1 = 0.8

power = powerCal(nSubj = 30, mu1 = mu1, 
  triangle = 0.05, rho = 0.93, rho11 = 0.59, rho22 = 0.56, rho12 = 0.52,
  p11 = 0.115, p10 = 0.142, p01 = 0.130, alpha = 0.05)

print(power)






