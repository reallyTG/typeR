library(FuzzyNumbers)


### Name: plot
### Title: Plot a Fuzzy Number
### Aliases: plot plot,FuzzyNumber,missing-method
###   plot,TrapezoidalFuzzyNumber,missing-method
###   plot,PiecewiseLinearFuzzyNumber,missing-method
###   plot,DiscontinuousFuzzyNumber,missing-method

### ** Examples

plot(FuzzyNumber(0,1,2,3), col="gray")
plot(FuzzyNumber(0,1,2,3, left=function(x) x^2, right=function(x) 1-x^3), add=TRUE)
plot(FuzzyNumber(0,1,2,3, lower=function(x) x, upper=function(x) 1-x), add=TRUE, col=2)



