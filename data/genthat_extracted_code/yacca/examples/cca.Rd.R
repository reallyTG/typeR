library(yacca)


### Name: cca
### Title: Canonical Correlation Analysis
### Aliases: cca print.cca print.summary.cca summary.cca plot.cca
### Keywords: models multivariate

### ** Examples

#Example parallels the R builtin cancor example
data(LifeCycleSavings)
pop <- LifeCycleSavings[, 2:3]
oec <- LifeCycleSavings[, -(2:3)]
cca.fit <- cca(pop, oec)

#View the results
cca.fit
summary(cca.fit)
plot(cca.fit)



