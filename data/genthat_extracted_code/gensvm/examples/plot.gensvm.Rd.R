library(gensvm)


### Name: plot.gensvm
### Title: Plot the simplex space of the fitted GenSVM model
### Aliases: plot.gensvm

### ** Examples

x <- iris[, -5]
y <- iris[, 5]

# train the model
fit <- gensvm(x, y)

# plot the simplex space
plot(fit)

# plot and use the true colors (easier to spot misclassified samples)
plot(fit, y)

# plot only misclassified samples
x.mis <- x[predict(fit) != y, ]
y.mis.true <- y[predict(fit) != y]
plot(fit, newdata=x.mis)
plot(fit, y.mis.true, newdata=x.mis)

# plot a 2-d model
xx <- x[y %in% c('versicolor', 'virginica'), ]
yy <- y[y %in% c('versicolor', 'virginica')]
fit <- gensvm(xx, yy, kernel='rbf', max.iter=1000)
plot(fit)




