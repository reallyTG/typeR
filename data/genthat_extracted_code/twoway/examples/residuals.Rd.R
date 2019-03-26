library(twoway)


### Name: residuals.twoway
### Title: Extract residuals from a twoway object
### Aliases: residuals.twoway fitted.twoway

### ** Examples

data(taskRT)
task.2way <- twoway(taskRT)
residuals(task.2way)
residuals(task.2way, nonadd=TRUE)

sum(residuals(task.2way)^2)               #  SSE for additive model
sum(residuals(task.2way, nonadd=TRUE)^2)  # SSPE, non-additive model
data(taskRT)
task.2way <- twoway(taskRT)
fitted(task.2way)
fitted(task.2way, nonadd=TRUE)




