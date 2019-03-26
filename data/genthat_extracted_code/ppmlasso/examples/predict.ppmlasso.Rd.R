library(ppmlasso)


### Name: predict.ppmlasso
### Title: Prediction to new data from a fitted regularisation path
### Aliases: predict.ppmlasso
### Keywords: predict

### ** Examples

data(BlueMountains)
sub.env = BlueMountains$env[BlueMountains$env$Y > 6270 & BlueMountains$env$X > 300,]
sub.euc = BlueMountains$eucalypt[BlueMountains$eucalypt$Y > 6270 & BlueMountains$eucalypt$X > 300,]
ppm.form = ~ poly(FC, TMP_MIN, TMP_MAX, RAIN_ANN, degree = 2, raw = TRUE)
ppm.fit  = ppmlasso(ppm.form, sp.xy = sub.euc, env.grid = sub.env, sp.scale = 1, n.fits = 20)
pred.mu  = predict(ppm.fit, newdata = sub.env)



