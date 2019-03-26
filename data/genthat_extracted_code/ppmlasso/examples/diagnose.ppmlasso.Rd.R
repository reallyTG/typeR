library(ppmlasso)


### Name: diagnose.ppmlasso
### Title: Create diagnostic plots for a fitted point process model.
### Aliases: diagnose.ppmlasso diagnose
### Keywords: residuals

### ** Examples

data(BlueMountains)
sub.env = BlueMountains$env[BlueMountains$env$Y > 6270 & BlueMountains$env$X > 300,]
sub.euc = BlueMountains$eucalypt[BlueMountains$eucalypt$Y > 6270 & BlueMountains$eucalypt$X > 300,]
ppm.form = ~ poly(FC, TMP_MIN, TMP_MAX, RAIN_ANN, degree=2) + poly(D_MAIN_RDS, D_URBAN, degree=2)
ppm.fit  = ppmlasso(ppm.form, sp.xy = sub.euc, env.grid = sub.env, sp.scale = 1, n.fits = 20)
diagnose(ppm.fit, which = "smooth", type = "Pearson")



