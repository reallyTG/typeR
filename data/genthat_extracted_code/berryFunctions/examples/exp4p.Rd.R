library(berryFunctions)


### Name: exp4p
### Title: 4-parametric exponential function
### Aliases: exp4p
### Keywords: nonlinear regression

### ** Examples

## Not run: 
##D ## Skip time consuming checks on CRAN
##D # exponential decline of temperature of a mug of hot chocolate
##D tfile <- system.file("extdata/Temp.txt", package="berryFunctions")
##D temp <- read.table(tfile, header=TRUE, dec=",")
##D head(temp)
##D plot(temp)
##D temp <- temp[-20,] # missing value - rmse would complain about it
##D x <- temp$Minuten
##D y <- temp$Temp
##D rm(tfile, temp)
##D 
##D exp4p(x,y, plot=TRUE)
##D # y=49*e^(-0.031*(x - 0  )) + 25 correct, judged from the model:
##D # Temp=T0 - Te *exp(k*t) + Te     with    T0=73.76,  Tend=26.21, k=-0.031
##D # optmethod="Nelder-Mead"  # y=52*e^(-0.031*(x + 3.4)) + 26 wrong
## End(Not run)




