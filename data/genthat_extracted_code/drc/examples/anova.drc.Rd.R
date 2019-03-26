library(drc)


### Name: anova.drc
### Title: ANOVA for dose-response model fits
### Aliases: anova.drc
### Keywords: models nonlinear

### ** Examples


## Comparing a Gompertz three- and four-parameter models using an F test
ryegrass.m1 <- drm(rootl ~ conc, data = ryegrass, fct = W1.4())
ryegrass.m2 <- drm(rootl ~ conc, data = ryegrass, fct = W1.3())
anova(ryegrass.m2, ryegrass.m1)  # reduction to 'W1.3' not possible (highly significant)   

anova(ryegrass.m2, ryegrass.m1, details = FALSE)  # without details




