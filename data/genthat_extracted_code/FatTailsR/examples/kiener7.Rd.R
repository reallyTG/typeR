library(FatTailsR)


### Name: kiener7
### Title: Asymmetric Kiener Distribution K7 (K2)
### Aliases: kiener7 dkiener7 pkiener7 qkiener7 rkiener7 dpkiener7
###   dqkiener7 lkiener7 dlkiener7 qlkiener7 varkiener7 ltmkiener7
###   rtmkiener7 dtmqkiener7 eskiener7

### ** Examples


head(ED <- fatreturns(extractData())) 
(coefk  <- paramkienerX(ED, dgts = 3))  
x  <- -4
xx <- -4:4
p  <- 0.1
pp <- pprobs2

dkiener7(x)
dkiener7(x,  coefk) 
dkiener7(xx)
dkiener7(xx, coefk)

pkiener7(x)
pkiener7(x,  coefk) 
pkiener7(xx)
pkiener7(xx, coefk)

qkiener7(p)
qkiener7(p,  coefk) 
qkiener7(pp)
qkiener7(pp, coefk)

rkiener7(10)
rkiener7(10, coefk)

varkiener7(p)
varkiener7(p, coefk)
varkiener7(pp)
varkiener7(pp, coefk) 

ltmkiener7(p)
ltmkiener7(p, coefk)
ltmkiener7(pp)
ltmkiener7(pp, coefk)

eskiener7(p)
eskiener7(p, coefk)
eskiener7(pp)
eskiener7(pp, coefk) 





