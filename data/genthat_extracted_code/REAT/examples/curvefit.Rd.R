library(REAT)


### Name: curvefit
### Title: Curve fitting
### Aliases: curvefit

### ** Examples

x <- 1:20
y <- 3-2*x
curvefit(x, y, plot.curves = TRUE)
# fit with plot
curvefit(x, y, extrapol=10, plot.curves = TRUE)
# fit and extrapolation with plot

x <- runif(20, min = 0, max = 100)
# some random data

# linear
y_resid <- runif(20, min = 0, max = 10)
# random residuals
y <- 3+(-0.112*x)+y_resid
curvefit(x, y)

# power
y_resid <- runif(20, min = 0.1, max = 0.2)
# random residuals
y <- 3*(x^-0.112)*y_resid
curvefit(x, y)

# exponential
y_resid <- runif(20, min = 0.1, max = 0.2)
# random residuals
y <- 3*exp(-0.112*x)*y_resid
curvefit(x, y)

# logistic
y_resid <- runif(20, min = 0.1, max = 0.2)
# random residuals
y <- 100/(1+exp(3+(-0.112*x)))*y_resid
curvefit(x, y)



