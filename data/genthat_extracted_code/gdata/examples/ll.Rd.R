library(gdata)


### Name: ll
### Title: Describe Objects or Elements
### Aliases: ll
### Keywords: data attribute classes list environment print utilities

### ** Examples

ll()
ll(all=TRUE)
ll("package:base")
ll("package:base", class="function", invert=TRUE)

data(infert)
ll(infert)
model <- glm(case~spontaneous+induced, family=binomial, data=infert)
ll(model, dim=TRUE)
ll(model, sort=TRUE)
ll(model$family)



