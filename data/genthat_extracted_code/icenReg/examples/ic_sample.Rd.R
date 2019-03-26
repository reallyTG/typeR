library(icenReg)


### Name: ic_sample
### Title: Draw samples from an icenReg model
### Aliases: ic_sample

### ** Examples

simdata <- simIC_weib(n = 500)

fit <- ic_par(cbind(l, u) ~ x1 + x2,
              data = simdata)

newdata = data.frame(x1 = c(0, 1), x2 = c(1,1))

sampleResponses <- ic_sample(fit, newdata = newdata, samples = 100)



