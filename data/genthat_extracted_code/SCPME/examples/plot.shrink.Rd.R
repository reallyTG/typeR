library(SCPME)


### Name: plot.shrink
### Title: Plot shrink object
### Aliases: plot.shrink

### ** Examples

# generate some data
data = data_gen(n = 100, p = 5, r = 1)

# lasso penalized beta (print estimated omega)
lam.max = max(abs(t(data$X) %*% data$Y))
(shrink = shrink(X = data$X, Y = data$Y, B = cov(data$X, data$Y), lam.max = lam.max))

# print estimated beta
shrink$Z

# create heatmap of CV errors
plot(shrink, type = 'heatmap')

# create line graph of CV errors
plot(shrink)



