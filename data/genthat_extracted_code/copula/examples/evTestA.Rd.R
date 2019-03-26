library(copula)


### Name: evTestA
### Title: Bivariate Test of Extreme-Value Dependence Based on Pickands'
###   Dependence Function
### Aliases: evTestA
### Keywords: htest multivariate

### ** Examples

## Do these data come from an extreme-value copula?
set.seed(63)
uG <- rCopula(100, gumbelCopula(3))
uC <- rCopula(100, claytonCopula(3))
## No test: 
## takes time: 48 seconds on MM's lynne (2012-06)
evTestA(uG)
evTestA(uG, derivatives = "Cn")

evTestA(uC)
## End(No test)
## Don't show: 
set.seed(34)
tG   <- evTestA(uG[1:10,])
tC.A <- evTestA(uC[1:12,])
tC.C <- evTestA(uC[1:20,], derivatives = "Cn")
stopifnot(
 all.equal(tG  $p.value, 27/2002,  tolerance= 1e-15),
 all.equal(tC.C$p.value,   1/182 , tolerance= 1e-15),
 all.equal(tC.C$p.value, tC.A$p.value, tolerance = 1e-15) # in < 10% of cases
)
## End(Don't show)



