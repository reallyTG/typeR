library(gamlss)


### Name: VC.test
### Title: Vuong and Clarke tests
### Aliases: VC.test
### Keywords: regression

### ** Examples

library(gamlss)
# fitting different models 
m0 <- gamlss(y~x+qrt, data=aids, family=PO)
m1 <- gamlss(y~pb(x)+qrt, data=aids, family=PO)
m2 <- gamlss(y~pb(x)+qrt, data=aids, family=NBI)
# comparison of the mdels
VC.test(m0,m2)
VC.test(m0,m1)
VC.test(m1,m2)



