library(ppmlasso)


### Name: envelope.ppmlasso
### Title: Calculates simulation envelopes for goodness-of-fit
### Aliases: envelope.ppmlasso

### ** Examples

data(BlueMountains)
sub.env = BlueMountains$env[BlueMountains$env$Y > 6270 & BlueMountains$env$X > 300,]
sub.euc = BlueMountains$eucalypt[BlueMountains$eucalypt$Y > 6270 & BlueMountains$eucalypt$X > 300,]
ppm.form = ~ poly(FC, TMP_MIN, TMP_MAX, RAIN_ANN, degree=2) + poly(D_MAIN_RDS, D_URBAN, degree=2)
ppm.fit  = ppmlasso(ppm.form, sp.xy = sub.euc, env.grid = sub.env, sp.scale = 1, n.fits = 20)
envelope(ppm.fit, Kinhom, nsim = 20)



