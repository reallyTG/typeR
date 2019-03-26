library(afpt)


### Name: fDfPfunctions
### Title: Coefficient for thrust dependency of drag and power factors
### Aliases: fD.ind fD.pro0 fD.pro2 fP.ind fP.pro0 fP.pro2

### ** Examples

## reduced frequency
kf <- 2*pi*4/10 # 4 Hz at 10 m/s

## strokeplane angle
phi <- 20*pi/180 # 20 degrees

## thrust ratio
TL <- 0.2

## induced drag factor:
fDind <- fD.ind(kf,phi)
kDind <- 1 + fDind*TL
print(kDind)
#   [1] 1.623659

## zero lift drag factor:
fDpro0 <- fD.pro0(kf,phi)
kDpro0 <- 1 + fDpro0*TL
print(kDpro0)
#   [1] 1.014899

## lift dependent profile drag factor:
fDpro2 <- fD.pro2(kf,phi)
kDpro2 <- 1 + fDpro2*TL
print(kDpro2)
#   [1] 1.511107

## induced power factor:
fPind <- fP.ind(kf,phi)
kPind <- 1 + fPind*TL
print(kPind)
#   [1] 1.996891

## zero lift power factor:
fPpro0 <- fP.pro0(kf,phi)
kPpro0 <- 1 + fPpro0*TL
print(kPpro0)
#   [1] 1.076046

## lift dependent profile power factor:
fPpro2 <- fP.pro2(kf,phi)
kPpro2 <- 1 + fPpro2*TL
print(kPpro2)
#   [1] 1.811983





