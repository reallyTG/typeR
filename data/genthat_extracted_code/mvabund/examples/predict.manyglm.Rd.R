library(mvabund)


### Name: predict.manyglm
### Title: Predict Method for MANYGLM Fits
### Aliases: predict.manyglm
### Keywords: models multivariate regression

### ** Examples

data(spider)
spiddat <- mvabund(spider$abund)
Y <- spiddat[1:20, ]
X <- data.frame(spider$x[1:20, ])
glm.spid.poiss <- manyglm(Y~soil.dry+bare.sand, family="poisson", data=X)
glm.spid.poiss$data = X
newdata <- data.frame(spider$x[21:28,])
predict(glm.spid.poiss, newdata)
pred.w.plim <- predict(glm.spid.poiss, newdata, interval="prediction")
pred.w.clim <- predict(glm.spid.poiss, newdata, interval="confidence")



