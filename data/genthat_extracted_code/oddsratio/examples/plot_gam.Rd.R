library(oddsratio)


### Name: plot_gam
### Title: Plot smoothing functions of GAM(M) models
### Aliases: plot_gam

### ** Examples

# load data (Source: ?mgcv::gam) and fit model
library(mgcv)
fit_gam <- mgcv::gam(y ~ s(x0) + s(I(x1^2)) + s(x2) + offset(x3) + x4,
                     data = data_gam)

library(oddsratio)
plot_gam(fit_gam, pred = "x2", title = "Predictor 'x2'")




