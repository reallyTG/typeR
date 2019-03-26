library(eply)


### Name: eply-package
### Title: The eply package provides ways to call 'eval(parse(text = ...))'
###   in bulk. The 'evals()' function is a vectorized version of
###   'eval(parse(text = ...))'. 'eply()' is like 'apply(MARGIN = 1)'
###   except that the elements of each row are 'eval(parse(text = ...))"ed
###   before being supplied to the function.
### Aliases: eply-package

### ** Examples

# Get an example data frame of commands that evaluate to function arguments.
.expr <- example.expr()
.fun <- example.fun # Get an example collection of functions.
# Get an example list of supporting data. Could be an environment.
.with <- example.with()
# Row-by-row, evaluate the code in .expr and feed the results to the function.
eply(.fun = .fun, .expr = .expr, .with = .with)
evals(x = c("a + 1", "b + 2"), .with = .with)



