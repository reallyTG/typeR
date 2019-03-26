library(ppmlasso)


### Name: ppmlasso
### Title: Fit point process models with LASSO penalties
### Aliases: ppmlasso
### Keywords: LASSO Point process models Regularisation path

### ** Examples

# Fit a regularisation path of Poisson point process models
data(BlueMountains)
sub.env = BlueMountains$env[BlueMountains$env$Y > 6270 & BlueMountains$env$X > 300,]
sub.euc = BlueMountains$eucalypt[BlueMountains$eucalypt$Y > 6270 & BlueMountains$eucalypt$X > 300,]
ppm.form = ~ poly(FC, TMP_MIN, TMP_MAX, RAIN_ANN, degree=2)
ppm.fit  = ppmlasso(ppm.form, sp.xy = sub.euc, env.grid = sub.env, sp.scale = 1, n.fits = 20)

#Fit a regularisation path of area-interaction models
data(BlueMountains)
ai.form  = ~ poly(FC, TMP_MIN, TMP_MAX, RAIN_ANN, degree=2)
ai.fit   = ppmlasso(ai.form, sp.xy = sub.euc, 
env.grid = sub.env, sp.scale = 1, family = "area.inter", 
r = 2, availability = BlueMountains$availability, n.fits = 20)



