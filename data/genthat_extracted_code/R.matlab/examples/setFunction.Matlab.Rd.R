library(R.matlab)


### Name: setFunction.Matlab
### Title: Defines a MATLAB function
### Aliases: setFunction.Matlab Matlab.setFunction
###   setFunction,Matlab-method
### Keywords: internal methods

### ** Examples
## Not run: 
##D code <- c(
##D   "function [win, aver] = dice(B)",
##D   "%Play the dice game B times",
##D   "gains = [-1, 2, -3, 4, -5, 6];",
##D   "plays = unidrnd(6, B, 1);",
##D   "win = sum(gains(plays));",
##D   "aver = win;"
##D )
##D 
##D setFunction(matlab, code)
##D evaluate(matlab, "[w, a] = dice(1000);")
##D res <- getVariable(matlab, c("w", "a"))
##D print(res)
## End(Not run)


