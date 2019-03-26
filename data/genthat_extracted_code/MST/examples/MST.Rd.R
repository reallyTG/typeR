library(MST)


### Name: MST
### Title: Multivariate Survival Trees
### Aliases: MST splitting.stat.MST1 splitting.stat.MST2
###   splitting.stat.MST3 splitting.stat.MST4
### Keywords: Trees Survival Multivariate Correlated

### ** Examples

set.seed(186117)
data <- rmultime(N = 200, K = 4, beta = c(-1, 0.8, 0.8, 0, 0), cutoff = c(0.5, 0.3, 0, 0),
    model = "marginal.multivariate.exponential", rho = 0.65)$dat
test <- rmultime(N = 100, K = 4, beta = c(-1, 0.8, 0.8, 0, 0), cutoff = c(0.5, 0.3, 0, 0),
    model = "marginal.multivariate.exponential", rho = 0.65)$dat

#Construct Multivariate Survival Tree:
fit <- MST(formula = Surv(time, status) ~ x1 + x2 + x3 + x4 | id, data, test,
    method = "marginal", minsplit = 100, minevents = 20, selection.method = "test.sample")

(tree_final <- getTree(fit, 4))
plot(tree_final)

#Fit a model from the final tree
data$term_nodes <- as.factor(predict(tree_final, newdata = data, type = 'node'))
coxph(Surv(time, status) ~ term_nodes + cluster(id), data = data)



