library(snfa)


### Name: reflect.data
### Title: Data reflection for kernel smoothing
### Aliases: reflect.data

### ** Examples

data(univariate)

#Extract data
X <- as.matrix(univariate$x)
y <- univariate$y

#Reflect data
reflected.data <- reflect.data(X, y)

X.reflected <- reflected.data$X
y.reflected <- reflected.data$y

#Plot
library(ggplot2)

plot.df <- data.frame(X = X.reflected,
                      y = y.reflected,
                      data = rep(c("reflected", "actual", "reflected"), each = nrow(X)))

ggplot(plot.df, aes(X, y)) +
  geom_point(aes(color = data))




