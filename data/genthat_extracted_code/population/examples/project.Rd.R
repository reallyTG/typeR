library(population)


### Name: project
### Title: Population projections
### Aliases: project C_montecarlo

### ** Examples

years <- 10
runs <- 100

init.pop <- c(30, 20, 15, 12, 10, 9, 8, 7, 6, 5)

surv.md <- c(0.5, 0.7, 0.9, 0.9, 0.9, 0.9, 0.9, 0.9, 0.9, 0.9)
surv.sd <- c(0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1)
surv.msd <- cbind(surv.md, surv.sd)

litter.md <- c(0.2, 1.1, 2.8, 2.8, 2.8, 2.8, 2.8, 2.8, 1.8, 0.2)
litter.sd <- c(0.1, 0.2, 0.15, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1)
litter.msd <- cbind(litter.md, litter.sd)

nclass <- 4 # vary number of classes

projection <- project(
	years = years,
	runs = runs,
	initial_population = init.pop[1:nclass],
	survival = surv.msd[1:nclass,],
	litter = litter.msd[1:nclass,]
	)



