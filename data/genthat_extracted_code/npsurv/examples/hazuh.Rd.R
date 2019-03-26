library(npsurv)


### Name: hazuh
### Title: Distributional Functions given a U-shaped Hazard Function
### Aliases: hazuh chazuh survuh denuh
### Keywords: function

### ** Examples

data(ap)
h = Uhaz(icendata(ap), deg=2)$h
hazuh(0:15, h)     # hazard
chazuh(0:15, h)    # cumulative hazard
survuh(0:15, h)    # survival probability
denuh(0:15, h)     # density



