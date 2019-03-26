library(ggm)


### Name: stress
### Title: Stress
### Aliases: stress
### Keywords: datasets

### ** Examples

data(stress)
G = UG(~ Y*X + X*V + V*U + U*Y)
fitConGraph(G, stress, 100)



