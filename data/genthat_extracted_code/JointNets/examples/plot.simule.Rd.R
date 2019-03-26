library(JointNets)


### Name: plot.simule
### Title: Plot simule result specified by user input
### Aliases: plot.simule

### ** Examples

library(JointNets)
data(exampleData)
result = simule(X = exampleData , lambda = 0.1, epsilon = 0.45, covType = "cov", FALSE)
plot(result)



