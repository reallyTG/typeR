library(glmpathcr)


### Name: summary.glmpathcr
### Title: Summarize a glmpathcr Object
### Aliases: summary.glmpathcr
### Keywords: methods

### ** Examples

data(diabetes)
x <- diabetes[, 2:dim(diabetes)[2]]
y <- diabetes$y
fit <- glmpathcr(x, y)
summary(fit)



