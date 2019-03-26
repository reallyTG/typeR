library(mvabund)


### Name: predict.manylm
### Title: Model Predictions for Multivariate Linear Models
### Aliases: predict.manylm
### Keywords: methods multivariate

### ** Examples

data(spider)
spiddat <- mvabund(spider$abund[1:20, ])
dat = data.frame(spider$x[1:20, ])
manylm.fit <- manylm(spiddat~soil.dry+bare.sand, data=dat)
predict(manylm.fit)
predict(manylm.fit, se.fit = TRUE)

new <- data.frame(spider$x[21:28, ])
predict(manylm.fit, new, se.fit = TRUE)




