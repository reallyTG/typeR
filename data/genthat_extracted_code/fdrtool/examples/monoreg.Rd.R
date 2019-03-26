library(fdrtool)


### Name: monoreg
### Title: Monotone Regression: Isotonic Regression and Antitonic
###   Regression
### Aliases: monoreg plot.monoreg fitted.monoreg residuals.monoreg
### Keywords: regression smooth

### ** Examples

# load "fdrtool" library
library("fdrtool")


# an example with weights

# Example 1.1.1. (dental study) from Robertson, Wright and Dykstra (1988)
age = c(14, 14, 8, 8, 8, 10, 10, 10, 12, 12, 12)
size = c(23.5, 25, 21, 23.5, 23, 24, 21, 25, 21.5, 22, 19)

mr = monoreg(age, size)

# sorted x values
mr$x # 8 10 12 14
# weights and merged y values
mr$w  # 3 3 3 2
mr$y #  22.50000 23.33333 20.83333 24.25000
# fitted y values
mr$yf # 22.22222 22.22222 22.22222 24.25000
fitted(mr)
residuals(mr)

plot(mr, ylim=c(18, 26))  # this shows the averaged data points
points(age, size, pch=2)  # add original data points


###

y = c(1,0,1,0,0,1,0,1,1,0,1,0)
x = 1:length(y)
mr = monoreg(y)

# plot with greatest convex minorant
plot(mr, plot.type="row.wise")  

# this is the same
mr = monoreg(x,y)
plot(mr)

# antitonic regression and least concave majorant
mr = monoreg(-y, type="a")
plot(mr, plot.type="row.wise")  

# the fit yf is independent of the location of x and y
plot(monoreg(x + runif(1, -1000, 1000), 
             y +runif(1, -1000, 1000)) )

###

y = c(0,0,2/4,1/5,2/4,1/2,4/5,5/8,7/11,10/11)
x = c(5,9,13,18,22,24,29,109,120,131)

mr = monoreg(x,y)
plot(mr, plot.type="row.wise")

# the fit (yf) only depends on the ordering of x
monoreg(1:length(y), y)$yf 
monoreg(x, y)$yf 





