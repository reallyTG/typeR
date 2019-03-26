library(cNORM)


### Name: simulateRasch
### Title: Simulate raw test scores based on Rasch model
### Aliases: simulateRasch

### ** Examples

# simulate data for a rather easy test (m = -1.0)
sim <- simulateRasch(n=150, minAge=1,
                     maxAge=7, items.n = 30, items.m = -1.0,
                     items.sd = 1, Theta = "random", width = 1.0)

# Show item difficulties
mean(sim$theta)
sd(sim$theta)
hist(sim$theta)

# Plot raw scores
boxplot(raw~group, data=sim$data)

# Model data
data <- prepareData(sim$data, age="age")
model <- bestModel(data, k = 4)
printSubset(model)
plotSubset(model, type=0)



