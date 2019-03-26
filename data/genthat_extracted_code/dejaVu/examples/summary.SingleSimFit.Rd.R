library(dejaVu)


### Name: summary.SingleSimFit
### Title: summary.SingleSimFit
### Aliases: summary.SingleSimFit

### ** Examples

sim <- SimulateComplete(study.time=365,number.subjects=50,
event.rates=c(0.01,0.005),dispersions=0.25)
fit <- Simfit(sim)
summary(fit)



