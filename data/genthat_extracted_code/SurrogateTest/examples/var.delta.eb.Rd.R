library(SurrogateTest)


### Name: var.delta.eb
### Title: Variance estimation
### Aliases: var.delta.eb
### Keywords: internal

### ** Examples

data(dataA)
data(dataB)

var.delta.eb(Axzero = dataA$x0, Adeltazero = dataA$delta0, 
Aszero = dataA$s0, Bxone = dataB$x1, Bdeltaone = dataB$delta1, 
Bsone = dataB$s1, Bxzero = dataB$x0, Bdeltazero = dataB$delta0, 
Bszero = dataB$s0, t=1, landmark=0.5,  extrapolate = TRUE)




