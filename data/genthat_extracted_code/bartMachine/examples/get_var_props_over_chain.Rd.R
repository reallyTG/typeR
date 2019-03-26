library(bartMachine)


### Name: get_var_props_over_chain
### Title: Get the Variable Inclusion Proportions
### Aliases: get_var_props_over_chain
### Keywords: ~kwd1 ~kwd2

### ** Examples

#generate Friedman data
set.seed(11)
n  = 200 
p = 10
X = data.frame(matrix(runif(n * p), ncol = p))
y = 10 * sin(pi* X[ ,1] * X[,2]) +20 * (X[,3] -.5)^2 + 10 * X[ ,4] + 5 * X[,5] + rnorm(n)

##build BART regression model
bart_machine = bartMachine(X, y, num_trees = 20)

#Get variable inclusion proportions
var_props = get_var_props_over_chain(bart_machine)
print(var_props)



