library(ppmlasso)


### Name: findres
### Title: Choose spatial resolution for analysis
### Aliases: findres

### ** Examples

data(BlueMountains)
sub.env = BlueMountains$env[BlueMountains$env$Y > 6270 & BlueMountains$env$X > 300,]
sub.euc = BlueMountains$eucalypt[BlueMountains$eucalypt$Y > 6270 & BlueMountains$eucalypt$X > 300,]
scales = c(0.5, 1, 2, 4, 8, 16)
ppm.form = ~ poly(FC, TMP_MIN, TMP_MAX, RAIN_ANN, degree=2)
findres(scales, formula = ppm.form, sp.xy = sub.euc, env.grid = sub.env)



