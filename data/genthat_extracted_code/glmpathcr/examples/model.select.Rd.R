library(glmpathcr)


### Name: model.select
### Title: Step of Optimal Fitted AIC or BIC CR Model.
### Aliases: model.select
### Keywords: misc

### ** Examples

data(diabetes)
x <- diabetes[, 2:dim(diabetes)[2]]
y <- diabetes$y
fit <- glmpathcr(x, y)
model.select(fit, which="AIC")



