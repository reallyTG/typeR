library(seacarb)


### Name: derivnum
### Title: Numerical derivatives of seawater carbonate system variables
### Aliases: derivnum
### Keywords: utilities

### ** Examples


## 1) For the input pair ALK and DIC (var1 and var2 when flag=15)
##    compute derivatives of all output varialbes 
##    with respect to DIC (i.e., var2)
derivnum(varid='var2', flag=15, var1=2300e-6, var2=2000e-6, 
         S=35, T=25, P=0, Patm=1.0, Pt=0, Sit=0,
         pHscale="T", kf="pf", k1k2="l", ks="d", b="u74")

## 2) For the input pair pH and ALK (var1 and var2 when flag=8)
##    compute derivatives of all output variables 
##    with respect to [H+] concentration
derivnum(varid='var1', flag=8, var1=8.2, var2=0.00234, 
         S=35, T=25, P=0, Patm=1.0, Pt=0, Sit=0,
         pHscale="T", kf="pf", k1k2="l", ks="d", b="u74")

## 3) Using vectors as arguments and compute derivatives of all output 
##    variables with respect to temperature
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
b <- c("u74", "u74", "u74")
derivnum(varid='T', flag=flag, var1=var1, var2=var2, S=S, T=T, P=P,
         Pt=Pt, Sit=Sit, kf=kf, k1k2=k1k2, pHscale=pHscale, b=b)

# For more examples of use of derivnum.R,
# consult the code of seacarb's errors routine.



