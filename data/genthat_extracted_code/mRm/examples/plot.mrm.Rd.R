library(mRm)


### Name: plot.mrm
### Title: Plot method for Objects of Class mrm.
### Aliases: plot.mrm

### ** Examples

#Simulate data matrix conforming to a mixed Rasch model with two classes
data <- sim.mrm(1000, 20, c(.5, .5))

#Parameter estimation
fit <- mrm(data$data.matrix, 2)

plot(fit)




