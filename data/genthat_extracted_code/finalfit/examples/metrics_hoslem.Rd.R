library(finalfit)


### Name: metrics_hoslem
### Title: Hosmer-Lemeshow goodness of fit test
### Aliases: metrics_hoslem

### ** Examples

fit = glm(mort_5yr~age.factor+extent.factor, data=colon_s, family="binomial")
metrics_hoslem(fit$y, fit$fitted)



