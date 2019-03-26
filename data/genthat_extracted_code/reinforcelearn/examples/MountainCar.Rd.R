library(reinforcelearn)


### Name: MountainCar
### Title: Mountain Car
### Aliases: MountainCar MountainCarContinuous, mountain.car MountainCar
###   MountainCarContinuous
### Keywords: datasets

### ** Examples

env = makeEnvironment("mountain.car")
env$reset()
env$step(1L)

env = makeEnvironment("mountain.car.continuous")
env$reset()
env$step(0.62)



