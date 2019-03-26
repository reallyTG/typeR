library(seacarb)


### Name: carb
### Title: Parameters of the seawater carbonate system
### Aliases: carb
### Keywords: utilities

### ** Examples


## With a couple of variables
carb(flag=8, var1=8.2, var2=0.00234, S=35, T=25, P=0, Patm=1.0, Pt=0, Sit=0,
	pHscale="T", kf="pf", k1k2="l", ks="d", b="u74")

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
carb(flag=flag, var1=var1, var2=var2, S=S, T=T, P=P,
  Pt=Pt, Sit=Sit, kf=kf, k1k2=k1k2, pHscale=pHscale, b=b)

## Test with all flags 
flag <- c((1:15), (21:25))
var1 <- c(8.200000, 7.308171e-06, 7.308171e-06, 7.308171e-06, 7.308171e-06, 
	8.2, 8.2, 8.2, 8.2, 0.001646857, 0.001646857, 0.001646857, 0.0002822957, 
	0.0002822957, 0.00234, 258.2164, 258.2164, 258.2164, 258.2164, 258.2164 )
var2 <- c(7.308171e-06, 0.001646857, 0.0002822957, 0.00234, 0.001936461, 
	0.001646857, 0.0002822957, 0.00234, 0.001936461, 0.0002822957, 
	0.00234, 0.001936461,  0.00234, 0.001936461, 0.001936461, 8.2, 
	0.001646857, 0.0002822957, 0.00234, 0.001936461)
carb(flag=flag, var1=var1, var2=var2)

## Test using a data frame 
data(seacarb_test_P0)	#test data set for P=0 (surface)
tab <- seacarb_test_P0[14:19,]

## method 1 using the column numbers
carb(flag=tab[[1]], var1=tab[[2]], var2=tab[[3]], S=tab[[4]], T=tab[[5]], 
P=tab[[6]], Sit=tab[[8]], Pt=tab[[7]])

## method 2 using the column names
carb(flag=tab$flag, var1=tab$var1, var2=tab$var2, S=tab$S, T=tab$T, 
P=tab$P, Sit=tab$Sit, Pt=tab$Pt)




