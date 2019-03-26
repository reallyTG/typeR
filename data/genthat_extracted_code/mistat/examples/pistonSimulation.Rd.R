library(mistat)


### Name: pistonSimulation
### Title: The Piston Simulator
### Aliases: pistonSimulation
### Keywords: datagen math

### ** Examples

Ps <- pistonSimulation(
  m = rep(60, 100),
  s = rep(0.02, 100),
  v0 = rep(0.01, 100),
  k = rep(5000, 100),
  p0 = rep(110000, 100),
  t = c(rep(296,35), 296*1.1^(1:65)),
  t0 = rep(360, 100),
  each = 1, 
  seed = 123,
  check = FALSE)
head(Ps)
tail(Ps)
plot(Ps$seconds)



