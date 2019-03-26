library(copula)


### Name: tauAMH
### Title: Ali-Mikhail-Haq ("AMH")'s and Joe's Kendall's Tau
### Aliases: tauAMH tauJoe
### Keywords: distribution

### ** Examples

tauAMH(c(0, 2^-40, 2^-20))
curve(tauAMH,  0, 1)
curve(tauAMH, -1, 1)# negative taus as well
curve(tauAMH, 1e-12, 1, log="xy") # linear, tau ~= 2/9*theta in the limit

curve(tauJoe, 1,      10)
curve(tauJoe, 0.2387, 10)# negative taus (*not* valid for Joe: no 2-monotone psi()!)



