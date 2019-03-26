library(EngrExpt)


### Name: viscosity
### Title: Time to gelling of paint samples
### Aliases: viscosity
### Keywords: datasets

### ** Examples

str(viscosity)
with(viscosity, summary(time))
qqmath(~ time, viscosity, aspect = 1,
       xlab = "Standard normal quantiles",
       ylab = "Time until paint sample gelled")
qqmath(~ sqrt(time), viscosity, aspect = 1,
       xlab = "Standard normal quantiles",
       ylab = "Square root of time until paint sample gelled")



