library(seacarb)


### Name: buffer
### Title: Buffer parameters of the seawater carbonate system
### Aliases: buffer
### Keywords: utilities

### ** Examples


## Computation with a couple of variables
buffer(flag=8, var1=8.2, var2=0.00234, S=35, T=25, Patm=1, P=0, Pt=0, 
	Sit=0, pHscale="T", kf="pf", k1k2="l", b="u74")

## Using vectors as arguments
flag <- c(8, 2, 8)
var1 <- c(8.2, 7.477544e-06, 8.2)
var2 <- c(0.002343955, 0.001649802, 2400e-6)
S <- c(35, 35, 30)
T <- c(25, 25, 30)
P <- c(0, 0, 0)
Pt <- c(0, 0, 0)
Sit <- c(0, 0, 0)
kf <- c("pf", "pf", "pf")
k1k2 <- c("l", "l", "l")
pHscale <- c("T", "T", "T")
b <- c("l10", "l10", "l10")
buffer(flag=flag, var1=var1, var2=var2, S=S, T=T, P=P, Pt=Pt, 
	Sit=Sit, kf=kf, k1k2=k1k2, pHscale=pHscale, b=b)


## Test for all flags 

flag <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 21, 22, 23, 24, 25)

var1 <- c(8.200000, 7.477544e-06, 7.477544e-06, 7.477544e-06, 7.477544e-06, 8.2, 
	8.2, 8.2, 8.2, 0.001685024, 0.001685024, 0.001685024,  0.0002888382, 
	0.0002888382, 0.002391252, 264.2008, 264.2008, 264.2008, 264.2008, 264.2008)

var2 <- c(7.477544e-06, 0.001685024, 0.0002888382, 0.002391252, 0.001981340, 
	0.001685024, 0.0002888382, 0.002391252, 0.001981340, 0.0002888382, 0.002391252,
	0.001981340,  0.002391252, 0.001981340, 0.001981340, 8.2, 0.001685024, 
	0.0002888382, 0.002391252, 0.001981340)

buffer(flag=flag, var1=var1, var2=var2)




