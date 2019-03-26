library(FAmle)


### Name: plot.mle
### Title: Diagnostic Plots for the Fitted Model
### Aliases: plot.mle
### Keywords: aplot models

### ** Examples

data(yarns)
x <- yarns$x
fit.1 <- mle(x,'weibull',c(.1,.1))
fit.2 <- mle(x,'logis',c(.1,.1))
plot(fit.1,TRUE,.05)
dev.new();plot(fit.2,TRUE,.05)



