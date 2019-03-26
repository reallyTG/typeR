library(copBasic)


### Name: N4212cop
### Title: The Copula of Equation 4.2.12 of Nelsen's Book
### Aliases: N4212cop
### Keywords: copula (formulas) copula

### ** Examples

N4212cop(0.4,0.6, para=1) == PSP(0.4,0.6) # TRUE
N4212cop(0.4,0.6, para=10) # 0.3999928
taildepCOP(cop=N4212cop, para=10) # LamL = 0.93303; LamU = 0.92823
## Not run: 
##D D <- simCOP(n=400, cop=N4212cop, para=2)
##D D <- simCOP(n=400, cop=N4212cop, para=10,  ploton=FALSE, col=2)
##D D <- simCOP(n=400, cop=N4212cop, para=100, ploton=FALSE, col=3)#
## End(Not run)



