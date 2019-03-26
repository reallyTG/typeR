library(isdals)


### Name: residualplot
### Title: Plots a standardaized residual
### Aliases: residualplot
### Keywords: hplot

### ** Examples

# Linear regression example
x <- rnorm(100)
y <- rnorm(100, mean=.5*x)
model <- lm(y ~ x)
residualplot(model)



