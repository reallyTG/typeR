library(envalysis)


### Name: mselect
### Title: envalysis reimplementation of mselect
### Aliases: mselect

### ** Examples

library(drc)

ryegrass.m1 <- drm(rootl ~ conc, data = ryegrass, fct = LL.4())
mselect(ryegrass.m1, list(LL.3(), LL.5(), W1.3(), W1.4(), W2.4(), baro5()))




