library(condSURV)


### Name: plot.survCS
### Title: Plot for an object of class "survCS".
### Aliases: plot.survCS

### ** Examples

fit1 <- survCOND(survCS(time1, event1, Stime, event) ~ 1, x = 365,
   data = colonCS, method = "LDM", conf = TRUE)

plot(fit1, xlab = "Time (days)", ylab = "S(y|365)", ylim = c(0.5, 1))

fit4 <- survCOND(survCS(time1, event1, Stime, event) ~ rx,
   x = 365, data = colonCS, method = "LDM")

plot(fit4, xlab = "Time (days)", ylab = "S(y|365)", ylim = c(0.5, 1))




