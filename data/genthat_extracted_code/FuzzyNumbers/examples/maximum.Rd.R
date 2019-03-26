library(FuzzyNumbers)


### Name: maximum
### Title: Maximum of fuzzy nubmers
### Aliases: maximum
###   maximum,PiecewiseLinearFuzzyNumber,PiecewiseLinearFuzzyNumber-method

### ** Examples

# example with low number of knots, showing the approximate nature
# of the result
x = as.PiecewiseLinearFuzzyNumber(TriangularFuzzyNumber(-4.8, -3 , -1.5))
y = as.PiecewiseLinearFuzzyNumber(TriangularFuzzyNumber(-5.5, -2.5, -1.1))
maxFN = maximum(x,y)
min = min(alphacut(x,0)[1],alphacut(y,0)[1])
max = max(alphacut(x,0)[2],alphacut(y,0)[2])
plot(x, col="red", xlim=c(min,max))
plot(y, col="blue", add=TRUE)
plot(maxFN, col="green", add=TRUE)

# example with high number of knots, that does not suffer 
# from the approximate nature of the result
x = as.PiecewiseLinearFuzzyNumber(TriangularFuzzyNumber(-4.8, -3 , -1.5), knot.n = 9)
y = as.PiecewiseLinearFuzzyNumber(TriangularFuzzyNumber(-5.5, -2.5, -1.1), knot.n = 9)
maxFN = maximum(x,y)
min = min(alphacut(x,0)[1],alphacut(y,0)[1])
max = max(alphacut(x,0)[2],alphacut(y,0)[2])
plot(x, col="red", xlim=c(min,max))
plot(y, col="blue", add=TRUE)
plot(maxFN, col="green", add=TRUE)



