library(geepack)


### Name: koch
### Title: Ordinal Data from Koch
### Aliases: koch
### Keywords: datasets

### ** Examples

data(koch)
fit <- ordgee(ordered(y) ~ trt + as.factor(day), id=id, data=koch, corstr="exch")
summary(fit)



