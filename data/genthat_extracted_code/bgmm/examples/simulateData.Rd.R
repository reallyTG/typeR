library(bgmm)


### Name: simulateData
### Title: Dataset generation
### Aliases: simulateData

### ** Examples

 simulated = simulateData(d=2, k=3, n=300, m=60, cov="0", within="E", n.labels=2)
 model = belief(X = simulated$X, knowns = simulated$knowns, B=simulated$B)
 plot(model)

 simulated = simulateData(d=1, k=2, n=300, m=60, n.labels=2)
 model = belief(X = simulated$X, knowns = simulated$knowns, B=simulated$B)
 plot(model)



