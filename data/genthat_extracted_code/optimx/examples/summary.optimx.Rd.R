library(optimx)


### Name: summary.optimx
### Title: Summarize optimx object
### Aliases: summary.optimx
### Keywords: nonlinear optimize

### ** Examples

ans <- optimx(fn = function(x) sum(x*x), par = 1:2)

# order by method name.
summary(ans, order = rownames)

# order by objective value. Do not show parameter values.
summary(ans, order = value, par.select = FALSE)

# order by objective value and then number of function evaluations
# such that objectives that are the same to 3 decimals are 
# considered the same.  Show only first parameter.
summary(ans, order = list(round(value, 3), fevals), par.select = 1)



