library(shiftR)


### Name: simulate
### Title: Generate Artificial Data for Tests and Illustrations
### Aliases: simulateNumeric simulateBinary simulatePValues

### ** Examples

n = 100000
sim = simulateNumeric(n, 0.5, 0.3)

# Means should be close to 0 (zero)
mean(sim$data1)
mean(sim$data2)

# Variances should be close to 1
var(sim$data1)
var(sim$data2)

# Correlation of adjacent observations
# should be close to 0.5
cor(sim$data1[-1], sim$data1[-n])
cor(sim$data2[-1], sim$data2[-n])

# Correlation between data sets 
# should be close to 0.3
cor(sim$data1, sim$data2)



