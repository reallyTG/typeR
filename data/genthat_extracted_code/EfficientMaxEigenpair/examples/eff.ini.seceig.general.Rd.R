library(EfficientMaxEigenpair)


### Name: eff.ini.seceig.general
### Title: General conservative matrix maximal eigenpair
### Aliases: eff.ini.seceig.general

### ** Examples

Q = matrix(c(-30, 1/5, 11/28, 55/3291, 30, -17, 275/42, 330/1097,
0, 84/5, -20, 588/1097, 0, 0, 1097/84, -2809/3291), 4, 4)
eff.ini.seceig.general(Q, z0 = 'Auto', digit.thresh = 5)
eff.ini.seceig.general(Q, z0 = 'fixed', digit.thresh = 5)



