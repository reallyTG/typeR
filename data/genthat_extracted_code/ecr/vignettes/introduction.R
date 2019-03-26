## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")
options(tibble.print_min = 4L, tibble.print_max = 4L)

## ---- fig.cap = "One-dimensional Ackley test function.", fig.width = 6, fig.height = 4----
library(ecr)
library(ggplot2)
library(smoof)
fn = makeAckleyFunction(1L)
pl = autoplot(fn, show.optimum=TRUE, length.out = 1000)
print(pl)

## ------------------------------------------------------------------------
MU = 30L; LAMBDA = 5L; MAX.ITER = 200L
lower = getLowerBoxConstraints(fn)
upper = getUpperBoxConstraints(fn)

## ------------------------------------------------------------------------
control = initECRControl(fn)
control = registerECROperator(control, "mutate", mutGauss, sdev = 2, lower = lower, upper = upper)
control = registerECROperator(control, "selectForSurvival", selGreedy)

## ------------------------------------------------------------------------
population = genReal(MU, getNumberOfParameters(fn), lower, upper)
fitness = evaluateFitness(control, population)
for (i in seq_len(MAX.ITER)) {
    # sample lambda individuals at random
    idx = sample(1:MU, LAMBDA)
    # generate offspring by mutation and evaluate their fitness
    offspring = mutate(control, population[idx], p.mut = 1)
    fitness.o = evaluateFitness(control, offspring)

    # now select the best out of the union of population and offspring
    sel = replaceMuPlusLambda(control, population, offspring, fitness, fitness.o)
    population = sel$population
    fitness = sel$fitness
}
print(min(fitness))
print(population[[which.min(fitness)]])

## ------------------------------------------------------------------------
res = ecr(fitness.fun = fn, representation = "float",
  n.dim = getNumberOfParameters(fn), survival.strategy = "plus",
  lower = lower, upper = upper,
  mu = MU, lambda = LAMBDA,
  mutator = setup(mutGauss, sdev = 2, lower = lower, upper = upper),
  terminators = list(stopOnIters(MAX.ITER)))
print(res$best.y)
print(res$best.x)

