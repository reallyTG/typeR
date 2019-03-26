library(irtProb)


### Name: conversion
### Title: Functions to Convert from and to CTT and IRT Models
### Aliases: ctt2irt irt2ctt
### Keywords: distribution

### ** Examples

## ....................................................................
# Values of p and rbis according to de a, b, c and d values
#  MODEL means that item parameters are from a NORMAL or LOGISTIC model
#  type
 irt2ctt()
 nItems <- 5
 b      <-  seq(-3, 3, length=nItems)
 a      <-  rep(1, nItems)
 c      <-  rep(0, nItems)
 d      <-  rep(1, nItems)
 
# Difference between classical item parameters and IRT ones
 irt2ctt(b=b,a=a,c=c,d=d,model="LOGISTIC")
 irt2ctt(b=b,a=a,c=c,d=d,model="NORMAL")

# Default values of a and b according p and rpbis
 ctt2irt()
 
# Verification of the recovery of original ctt item parameters
 nItems <- 5
 p      <- seq(0.10, 0.90, length=nItems)
 rpbis  <- seq(0.50, 0.95, length=nItems)
 irt    <- ctt2irt(dif=p, rpbis=rpbis)
 clas   <- irt2ctt(b=irt$irt[6:10], a=irt$irt[1:5], model="LOGISTIC")
 data.frame(NORMAL=irt$normal, IRT=irt$irt, CTT=clas,ORIGINAL=c(rpbis,p))
 clas   <- irt2ctt(b=irt$normal[6:10], a=irt$normal[1:5], model="NORMAL")
 data.frame(NORMAL=irt$normal, IRT=irt$irt, CTT=clas,ORIGINAL=c(rpbis,p))
## ....................................................................



