library(eply)


### Name: evals
### Title: Function 'evals'
### Aliases: evals

### ** Examples

# Get an example list of supporting data. Could be an environment.
.with <- example.with()
# Row-by-row, evaluate the code in .expr and feed the results to the function.
evals(x = c("a + 1", "b + 2"), .with = .with)



