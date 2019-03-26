library(semPLS)


### Name: semplsGOF
### Title: Quality Indices and Goodness of fit measures for pls path models
### Aliases: semplsGOF rSquared rSquared.sempls print.rSquared qSquared
###   qSquared.sempls print.qSquared dgrho dgrho.sempls print.dgrho
###   communality communality.sempls print.communality communality
###   communality.sempls print.communality redundancy redundancy.sempls
###   print.redundancy rSquared2 rSquared2.sempls print.rSquared2 gof
###   gof.sempls print.gof

### ** Examples

data(ECSImobi)
ecsi <- sempls(model=ECSImobi, data=mobi, E="C")

### R-squared
rSquared(ecsi)

### Q-squared with omission distance d=4
qSquared(ecsi, d=4)

### Dillon-Goldstein's rho (aka composite reliability)
dgrho(ecsi)

### Communalities
communality(ecsi)

### Redundancy
redundancy(ecsi)

### R-squared (normal + corrected)
rSquared2(ecsi)

### Goodness of fit
gof(ecsi)

### check for discriminant validity using loadings
l <-plsLoadings(ecsi)
print(l, type="discriminant", cutoff=0.5, reldiff=0.2)



