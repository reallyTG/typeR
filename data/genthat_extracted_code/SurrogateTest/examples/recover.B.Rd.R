library(SurrogateTest)


### Name: recover.B
### Title: Recover an estimate of the treatment effect at time t in Study B
### Aliases: recover.B
### Keywords: survival nonparametric

### ** Examples

## No test: 
data(dataA)
data(dataB)
recover.B(Axzero = dataA$x0, Adeltazero = dataA$delta0, Aszero = dataA$s0, Axone 
= dataA$x1, Adeltaone = dataA$delta1, Asone = dataA$s1, Bxzero = dataB$x0, Bdeltazero
= dataB$delta0, Bszero = dataB$s0, Bxone = dataB$x1, Bdeltaone = dataB$delta1, Bsone 
= dataB$s1, t=1, landmark=0.5,  extrapolate = T)

recover.B(Axzero = dataA$x0, Adeltazero = dataA$delta0, Aszero = dataA$s0, Axone 
= dataA$x1, Adeltaone = dataA$delta1, Asone = dataA$s1, Bxzero = dataB$x0, Bdeltazero
= dataB$delta0, Bszero = dataB$s0, Bxone = dataB$x1, Bdeltaone = dataB$delta1, Bsone 
= dataB$s1, t=0.75, landmark=0.5,  extrapolate = T)

## End(No test)



