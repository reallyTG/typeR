library(VGAM)


### Name: multilogit
### Title: Multi-logit Link Function
### Aliases: multilogit
### Keywords: math models regression

### ** Examples

pneumo <- transform(pneumo, let = log(exposure.time))
fit <- vglm(cbind(normal, mild, severe) ~ let,
            multinomial, trace = TRUE, data = pneumo)  # For illustration only!
fitted(fit)
predict(fit)

multilogit(fitted(fit))
multilogit(fitted(fit)) - predict(fit)  # Should be all 0s

multilogit(predict(fit), inverse = TRUE)  # rowSums() add to unity
multilogit(predict(fit), inverse = TRUE, refLevel = 1)  # For illustration only
multilogit(predict(fit), inverse = TRUE) - fitted(fit)  # Should be all 0s

multilogit(fitted(fit), deriv = 1)
multilogit(fitted(fit), deriv = 2)



