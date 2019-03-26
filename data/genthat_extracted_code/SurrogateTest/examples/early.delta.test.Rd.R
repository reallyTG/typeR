library(SurrogateTest)


### Name: early.delta.test
### Title: Estimate and test the early treatment effect
### Aliases: early.delta.test
### Keywords: survival nonparametric htest

### ** Examples

data(dataA)
data(dataB)
early.delta.test(Axzero = dataA$x0, Adeltazero = dataA$delta0, Aszero = dataA$s0, 
Bxzero = dataB$x0, Bdeltazero = dataB$delta0, Bszero = dataB$s0, Bxone = dataB$x1, 
Bdeltaone = dataB$delta1, Bsone = dataB$s1, t=1, landmark=0.5, perturb = FALSE, 
extrapolate = TRUE)

early.delta.test(Axzero = dataA$x0, Adeltazero = dataA$delta0, Aszero = dataA$s0, 
Bxzero = dataB$x0, Bdeltazero = dataB$delta0, Bszero = dataB$s0, Bxone = dataB$x1, 
Bdeltaone = dataB$delta1, Bsone = dataB$s1, t=0.75, landmark=0.5, perturb = FALSE, 
extrapolate = TRUE)

## No test: 
early.delta.test(Axzero = dataA$x0, Adeltazero = dataA$delta0, Aszero = dataA$s0, 
Bxzero = dataB$x0, Bdeltazero = dataB$delta0, Bszero = dataB$s0, Bxone = dataB$x1, 
Bdeltaone = dataB$delta1, Bsone = dataB$s1, t=1, landmark=0.5, perturb = TRUE, 
extrapolate = TRUE)	
## End(No test)




