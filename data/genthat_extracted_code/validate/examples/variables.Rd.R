library(validate)


### Name: variables
### Title: Get variable names
### Aliases: variables variables,rule-method variables,list-method
###   variables,data.frame-method variables,environment-method
###   variables,expressionset-method

### ** Examples


v <- validator(
  root = y := sqrt(x)
 , average = mean(x) > 3
 , sum = x + y == z
)
variables(v)
variables(v,dummy=TRUE)
variables(v,matrix=TRUE)
variables(v,matrix=TRUE,dummy=TRUE)





