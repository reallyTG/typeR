library(LinCal)


### Name: LinCal-package
### Title: Static Univariate Frequentist and Bayesian Linear Calibration
### Aliases: LinCal-package LinCal
### Keywords: package

### ** Examples

library(LinCal)

data(wheat)

plot(wheat[,6],wheat[,2])

## Classical Approach
class.calib(wheat[,6],wheat[,2],0.05,105)

## Inverse Approach
inver.calib(wheat[,6],wheat[,2],0.05,105)

## Bayesian Inverse Approach
hoad.calib(wheat[,6],wheat[,2],0.05,105)

##Bayesian Classical Approach
huntlam.calib(wheat[,6],wheat[,2],0.05,105)



