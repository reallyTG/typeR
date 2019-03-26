library(SharpeR)


### Name: power.sr_test
### Title: Power calculations for Sharpe ratio tests
### Aliases: power.sr_test
### Keywords: htest

### ** Examples

anex <- power.sr_test(253,1,0.05,NULL,ope=253) 
anex <- power.sr_test(n=253,zeta=NULL,sig.level=0.05,power=0.5,ope=253) 
anex <- power.sr_test(n=NULL,zeta=0.6,sig.level=0.05,power=0.5,ope=253) 
# Lehr's Rule 
zetas <- seq(0.1,2.5,length.out=51)
ssizes <- sapply(zetas,function(zed) { 
  x <- power.sr_test(n=NULL,zeta=zed,sig.level=0.05,power=0.8,
       alternative="two.sided",ope=253)
  x$n / 253})
# should be around 8.
print(summary(ssizes * zetas * zetas))
# e = n z^2 mnemonic approximate rule for 0.05 type I, 50% power
ssizes <- sapply(zetas,function(zed) { 
  x <- power.sr_test(n=NULL,zeta=zed,sig.level=0.05,power=0.5,ope=253)
  x$n / 253 })
print(summary(ssizes * zetas * zetas - exp(1)))




