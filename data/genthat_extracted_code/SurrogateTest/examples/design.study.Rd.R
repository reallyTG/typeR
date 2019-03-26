library(SurrogateTest)


### Name: design.study
### Title: Power and sample size calculation for designing a future study
### Aliases: design.study
### Keywords: survival nonparametric htest

### ** Examples

data(dataA)
design.study(Axzero = dataA$x0, Adeltazero = dataA$delta0, Aszero = dataA$s0, 
Axone = dataA$x1, Adeltaone = dataA$delta1, Asone = dataA$s1, t=1, landmark=0.5, 
power = 0.80, cens.rate=0.5)

design.study(Axzero = dataA$x0, Adeltazero = dataA$delta0, Aszero = dataA$s0, 
Axone = dataA$x1, Adeltaone = dataA$delta1, Asone = dataA$s1, t=1, landmark=0.5, 
n=2500, cens.rate=0.5)

design.study(Axzero = dataA$x0, Adeltazero = dataA$delta0, Aszero = dataA$s0, 
Axone = dataA$x1, Adeltaone = dataA$delta1, Asone = dataA$s1, t=1, landmark=0.5, 
power = 0.80, cens.rate=0.5, psi = 0.05)



