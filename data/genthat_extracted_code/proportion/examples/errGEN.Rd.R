library(proportion)


### Name: errGEN
### Title: Calculates error, long term power and pass/fail criteria for CI
###   obtained from any method
### Aliases: errGEN

### ** Examples

LL=c(0,0.01,0.0734,0.18237,0.3344,0.5492)		#Lower and Upper Limits
UL=c(0.4507,0.6655,0.8176,0.9265,0.9899,1)
n= 5; alp=0.05;phi=0.05; f=-2
errGEN(n,LL,UL,alp,phi,f)



