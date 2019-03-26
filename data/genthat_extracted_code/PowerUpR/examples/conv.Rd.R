library(PowerUpR)


### Name: conversion
### Title: Object Conversion
### Aliases: mrss.to.mdes mrss.to.power power.to.mdes mdes.to.power
###   mdes.to.pctl

### ** Examples

design1 <- power.bira2r1(es=.15, rho2=.35, omega2=.10, n=83, J=10)
design2 <- power.to.mdes(design1)
mdes.to.pctl(design2)



