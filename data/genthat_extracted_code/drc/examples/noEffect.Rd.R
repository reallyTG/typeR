library(drc)


### Name: noEffect
### Title: Testing if there is a dose effect at all
### Aliases: noEffect
### Keywords: models nonlinear

### ** Examples


ryegrass.LL.4 <- drm(rootl ~ conc, data = ryegrass, fct = LL.4())

noEffect(ryegrass.LL.4)
# p-value < 0.0001: there is a highly significant dose effect!




