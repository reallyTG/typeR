library(eply)


### Name: eply
### Title: Function 'eply'
### Aliases: eply

### ** Examples

# Get an example data frame of commands that evaluate to function arguments.
.expr <- example.expr()
.fun <- example.fun # Get an example collection of functions.
# Get an example list of supporting data. Could be an environment.
.with <- example.with()
# Row-by-row, evaluate the code in .expr and feed the results to the function.
eply(.fun = .fun, .expr = .expr, .with = .with)



