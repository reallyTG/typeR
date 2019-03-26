library(mudens)


### Name: mudens
### Title: Estimate density function from right-censored survival data
### Aliases: mudens

### ** Examples

time <- rexp(1000)
stat <- sample(c(0,1), 1000, 0.5)
fit <- mudens(time, stat)
summary(fit)





