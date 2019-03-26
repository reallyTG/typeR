library(yacca)


### Name: helio.plot
### Title: Helio Plots
### Aliases: helio.plot
### Keywords: hplot

### ** Examples

data(LifeCycleSavings)
pop <- LifeCycleSavings[, 2:3]
oec <- LifeCycleSavings[, -(2:3)]
cca.fit <- cca(pop, oec)

#Show loadings on first canonical variate
helio.plot(cca.fit, x.name="Population Variables", 
    y.name="Economic Variables")

#Show variances on second canonical variate
helio.plot(cca.fit, cv=2, x.name="Population Variables", 
    y.name="Economic Variables", type="variance")



