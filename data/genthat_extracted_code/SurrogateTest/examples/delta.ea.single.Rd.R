library(SurrogateTest)


### Name: delta.ea.single
### Title: Calculates the early treatment effect estimate in Study A
### Aliases: delta.ea.single
### Keywords: survival nonparametric internal

### ** Examples

data(dataA)

delta.ea.single(Axzero = dataA$x0, Adeltazero = dataA$delta0, 
Aszero = dataA$s0, Bxzero = dataA$x0, Bdeltazero = dataA$delta0, 
Bszero = dataA$s0, Bxone = dataA$x1, Bdeltaone = dataA$delta1, 
Bsone = dataA$s1, t=1, landmark=0.5,  extrapolate = TRUE)




