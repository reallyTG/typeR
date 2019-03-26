library(psycho)


### Name: analyze.blavaan
### Title: Analyze blavaan (SEM or CFA) objects.
### Aliases: analyze.blavaan

### ** Examples

library(psycho)
library(lavaan)

model <- " visual  =~ x1 + x2 + x3\ntextual =~ x4 + x5 + x6\nspeed   =~ x7 + x8 + x9 "
x <- lavaan::cfa(model, data = HolzingerSwineford1939)

rez <- analyze(x)
print(rez)



