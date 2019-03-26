library(RClone)


### Name: Pareto_index
### Title: Pareto index
### Aliases: Pareto_index Pareto_index_core
### Keywords: documentation

### ** Examples

data(posidonia)

Pareto_index(posidonia, graph = TRUE, legends = 2)

res <- Pareto_index(posidonia, full = TRUE)[[4]]

xi <- res[,1]
yi <- res[,2]
exp(summary(lm(log10(yi)~log10(xi)))$coefficients[1]) ##true b of y=ax+b



