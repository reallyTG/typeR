library(SDT)


### Name: simplex
### Title: Motivation Simplex Structure Shares
### Aliases: simplex
### Keywords: attribute classes models regression

### ** Examples

## attach dataset to search path (to use variable names)
attach(learning_motivation)

## simplex structure analysis with intrinsic regulation as target variable
## and identified, introjected, and external regulation as reference system
(simstr <- simplex(intrinsic, identified, introjected, external))

## numeric vector, attribute value, and class
mode(simstr)
attr(simstr, "analysis")
class(simstr)



