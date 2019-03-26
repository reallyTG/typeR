library(stochvol)


### Name: svsim
### Title: Simulating a Stochastic Volatility Process
### Aliases: svsim
### Keywords: datagen ts

### ** Examples

## Simulate a highly persistent SV process of length 500
sim <- svsim(500, phi = 0.99, sigma = 0.1)

print(sim)
summary(sim)
plot(sim)



