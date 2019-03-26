library(funData)


### Name: as.multiFunData
### Title: Coerce a funData object to class multiFunData
### Aliases: as.multiFunData as.multiFunData,funData-method

### ** Examples

# create funData object with 5 observations
x <- seq(0,1,0.01)
f1 <- funData(argvals = x, X = 1:5 %o% x)
f1
class(f1)

# coerce to multiFunData object (of length 1)
m1 <- as.multiFunData(f1)
m1
class(m1)



