library(drc)


### Name: neill.test
### Title: Neill's lack-of-fit test for dose-response models
### Aliases: neill.test
### Keywords: models nonlinear

### ** Examples


### Example with 'drc' object

## Lack-of-fit test against ANOVA
ryegrass.m1 <-drm(rootl~conc, data = ryegrass, fct = LL.4())
modelFit(ryegrass.m1)

## The same test using 'neill.test'
neill.test(ryegrass.m1, ryegrass$conc)

## Generating a grouping
neill.test(ryegrass.m1, method="c-finest")
neill.test(ryegrass.m1, method="finest")
neill.test(ryegrass.m1, method="perc")





