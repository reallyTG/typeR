library(ppmlasso)


### Name: print.ppmlasso
### Title: Print a fitted regularisation path
### Aliases: print.ppmlasso

### ** Examples

# Fit a regularisation path of Poisson point process models
data(BlueMountains)
ppm.form = ~ poly(FC, TMP_MIN, TMP_MAX, RAIN_ANN, degree=2)
ppm.fit  = ppmlasso(ppm.form, sp.xy = BlueMountains$eucalypt, 
env.grid = BlueMountains$env, sp.scale = 1, n.fits = 20)
print(ppm.fit)



