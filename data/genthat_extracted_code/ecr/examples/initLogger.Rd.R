library(ecr)


### Name: initLogger
### Title: Initialize a log object.
### Aliases: initLogger

### ** Examples

control = initECRControl(function(x) sum(x), minimize = TRUE,
  n.objectives = 1L)
control = registerECROperator(control, "mutate", mutBitflip, p = 0.1)
control = registerECROperator(control, "selectForMating", selTournament, k = 2)
control = registerECROperator(control, "selectForSurvival", selGreedy)

log = initLogger(control,
  log.stats = list(
    fitness = list("mean", "myRange" = function(x) max(x) - min(x)),
    age = list("min", "max")
  ), log.pop = TRUE, init.size = 1000L)

 # simply pass stuff down to control object constructor
population = initPopulation(mu = 10L, genBin, n.dim = 10L)
fitness = evaluateFitness(control, population)

# append fitness to individuals and init age
for (i in seq_along(population)) {
  attr(population[[i]], "fitness") = fitness[, i]
  attr(population[[i]], "age") = 1L
}

for (iter in seq_len(10)) {
  # generate offspring
  offspring = generateOffspring(control, population, fitness, lambda = 5)
  fitness.offspring = evaluateFitness(control, offspring)

  # update age of population
  for (i in seq_along(population)) {
    attr(population[[i]], "age") = attr(population[[i]], "age") + 1L
  }

  # set offspring attributes
  for (i in seq_along(offspring)) {
    attr(offspring[[i]], "fitness") = fitness.offspring[, i]
    # update age
    attr(offspring[[i]], "age") = 1L
  }

  sel = replaceMuPlusLambda(control, population, offspring)

  population = sel$population
  fitness = sel$fitness

  # do some logging
  updateLogger(log, population, n.evals = 5)
}
head(getStatistics(log))



