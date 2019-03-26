library(formula.tools)


### Name: get.vars
### Title: Get variable (names) from various R objects
### Aliases: get.vars get.vars,formula,ANY-method get.vars,call,ANY-method
###   get.vars,expression,missing-method get.vars,name,ANY-method
###   get.vars,ANY,ANY-method get.vars,ANY,ANY-methods
###   get.vars,NULL,ANY-method get.vars,NULL,ANY-methods lhs.vars .lhs.vars
###   lhs.vars,formula-method lhs.vars,call-method
###   lhs.vars,expression-method rhs.vars .rhs.vars rhs.vars,formula-method
###   rhs.vars,call-method rhs.vars,expression-method

### ** Examples

  get.vars( Species ~ ., iris )
  get.vars( quote( Sepal.Length * Sepal.Width ), iris )
  



