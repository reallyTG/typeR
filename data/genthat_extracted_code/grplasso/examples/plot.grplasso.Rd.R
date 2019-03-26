library(grplasso)


### Name: plot.grplasso
### Title: Plots the Solution Path of a grplasso Object
### Aliases: plot.grplasso
### Keywords: hplot

### ** Examples

data(splice)

contr <- list(Pos.1 = "contr.sum", Pos.2 = "contr.sum")
lambda <- lambdamax(y ~ Pos.1 * Pos.2, data = splice, model = LogReg(),
                    contrasts = contr, standardize = TRUE) * 0.8^(0:8)

fit <- grplasso(y ~ Pos.1 * Pos.2, data = splice, model = LogReg(),
                lambda = lambda, contrasts = contr, standardize = TRUE,
                control = grpl.control(trace = 0, inner.loops = 0,
                update.every = 1, update.hess = "lambda"))
plot(fit, log = "x")



