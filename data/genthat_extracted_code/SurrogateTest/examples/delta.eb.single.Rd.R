library(SurrogateTest)


### Name: delta.eb.single
### Title: Calculates the early treatment effect estimate in Study B
### Aliases: delta.eb.single
### Keywords: survival nonparametric internal

### ** Examples

data(dataA)
data(dataB)

delta.eb.single(Axzero = dataA$x0, Adeltazero = dataA$delta0, 
Aszero = dataA$s0, Bxzero = dataB$x0, Bdeltazero = dataB$delta0, 
Bszero = dataB$s0, Bxone = dataB$x1, Bdeltaone = dataB$delta1, 
Bsone = dataB$s1, t=1, landmark=0.5,  extrapolate = TRUE)




