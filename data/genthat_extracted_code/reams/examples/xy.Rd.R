library(reams)


### Name: xy
### Title: Random generation of linear model matrix and outcomes
### Aliases: xy

### ** Examples

# Generate 40 vectors of 8 candidate predictors, of which 
# (the first) 2 have nonzero coefficients, along with 40 outcomes,
# with R^2=.8
tmp = xy(40, 9, 3, .8)

# As a side effect, the above created objects y5 and X59,
# equal to tmp$y and tmp$X respectively.
# The following lines can then be used to examine how different
# information criteria fare at identifying the true model as "best". 
ic.min(y3, x39)
eic(y3, x39, nboot=100)
cvic(y3, x39)



