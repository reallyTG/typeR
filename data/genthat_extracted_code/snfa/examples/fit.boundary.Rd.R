library(snfa)


### Name: fit.boundary
### Title: Multivariate smooth boundary fitting with additional constraints
### Aliases: fit.boundary

### ** Examples

data(univariate)

#Set up data for fitting

X <- as.matrix(univariate$x)
y <- univariate$y

N.fit <- 100
X.fit <- as.matrix(seq(min(X), max(X), length.out = N.fit))

#Reflect data for fitting
reflected.data <- reflect.data(X, y)
X.eval <- reflected.data$X
y.eval <- reflected.data$y

#Fit frontiers
frontier.u <- fit.boundary(X.eval, y.eval, 
                           X.bounded = X, y.bounded = y,
                           X.constrained = X.fit,
                           X.fit = X.fit,
                           method = "u")
                          
frontier.m <- fit.boundary(X.eval, y.eval, 
                           X.bounded = X, y.bounded = y,
                           X.constrained = X.fit,
                           X.fit = X.fit,
                           method = "m")
                          
frontier.mc <- fit.boundary(X.eval, y.eval, 
                            X.bounded = X, y.bounded = y,
                            X.constrained = X.fit,
                            X.fit = X.fit,
                            method = "mc")

#Plot frontier
library(ggplot2)

frontier.df <- data.frame(X = rep(X.fit, times = 3),
                          y = c(frontier.u$y.fit, frontier.m$y.fit, frontier.mc$y.fit),
                          model = rep(c("u", "m", "mc"), each = N.fit))

ggplot(univariate, aes(X, y)) +
  geom_point() +
  geom_line(data = frontier.df, aes(color = model))

#Plot slopes
slope.df <- data.frame(X = rep(X.fit, times = 3),
                       slope = c(frontier.u$gradient.fit,
                                 frontier.m$gradient.fit,
                                 frontier.mc$gradient.fit),
                       model = rep(c("u", "m", "mc"), each = N.fit))

ggplot(slope.df, aes(X, slope)) +
  geom_line(aes(color = model))
  



