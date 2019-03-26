library(drc)


### Name: hatvalues.drc
### Title: Model diagnostics for nonlinear dose-response models
### Aliases: hatvalues.drc cooks.distance.drc
### Keywords: models nonlinear

### ** Examples


ryegrass.LL.4 <- drm(rootl ~ conc, data = ryegrass, fct = LL.4())

hatvalues(ryegrass.LL.4)

cooks.distance(ryegrass.LL.4)




