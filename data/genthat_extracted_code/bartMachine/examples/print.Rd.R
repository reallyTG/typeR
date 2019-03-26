library(bartMachine)


### Name: print.bartMachine
### Title: Summarizes information about a 'bartMachine' object.
### Aliases: print.bartMachine
### Keywords: ~kwd1 ~kwd2

### ** Examples

#Regression example

#generate Friedman data
set.seed(11)
n  = 200 
p = 5
X = data.frame(matrix(runif(n * p), ncol = p))
y = 10 * sin(pi* X[ ,1] * X[,2]) +20 * (X[,3] -.5)^2 + 10 * X[ ,4] + 5 * X[,5] + rnorm(n)

##build BART regression model
bart_machine = bartMachine(X, y)

##print out details
print(bart_machine)

##Also, the default print works too
bart_machine



