library(coda.base)


### Name: pb_basis
### Title: Isometric log-ratio basis based on Principal Balances.
### Aliases: pb_basis

### ** Examples

set.seed(1)
X = matrix(exp(rnorm(5*100)), nrow=100, ncol=5)
# Optimal variance obtained with Principal components
(v1 <- apply(coordinates(X, 'pc'), 2, var))
# Optimal variance obtained with Principal balances
(v2 <- apply(coordinates(X,pb_basis(X, method='exact')), 2, var))
# Solution obtained using a hill climbing algorithm from pc approximation
apply(coordinates(X,pb_basis(X, method='lsearch')), 2, var)
# Solution obtained using a hill climbing algorithm using 10 restartings
apply(coordinates(X,pb_basis(X, method='lsearch', rep=10)), 2, var)
# Solution obtained using Ward method
(v3 <- apply(coordinates(X,pb_basis(X, method='ward.D2')), 2, var))
# Solution obtained using Old Ward function (in R versions <= 3.0.3)
apply(coordinates(X,pb_basis(X, method='ward.D')), 2, var)
# Plotting the variances
barplot(rbind(v1,v2,v3), beside = TRUE, legend = c('PC','PB','Ward'), args.legend = list(cex = 0.8))




