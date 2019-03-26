library(greybox)


### Name: xregExpander
### Title: Exogenous variables expander
### Aliases: xregExpander
### Keywords: models nonlinear regression ts

### ** Examples

# Create matrix of two variables, make it ts object and expand it
x <- cbind(rnorm(100,100,1),rnorm(100,50,3))
x <- ts(x,frequency=12)
xregExpander(x)




