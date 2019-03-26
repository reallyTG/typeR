library(tatest)


### Name: omega
### Title: Omega calcularion
### Aliases: omega
### Keywords: thresholds rho

### ** Examples

X<-c(112,122,108,127)
Y<-c(302, 314,322,328)
omega(XA=X, XB=Y, na=4, nb=4, m=2000, alpha = 0.05)
#[1] 0.9055152
 omega(XA=X, XB=Y, na=4, nb=4, m=2000, alpha = 0.05,distr="NB")
#[1] 0.8995424
omega(XA=X, XB=Y, na=4, nb=4, m=2000, alpha = 0.05,distr="uniform")
#[1] 0.97194



