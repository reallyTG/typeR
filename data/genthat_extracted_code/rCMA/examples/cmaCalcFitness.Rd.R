library(rCMA)


### Name: cmaCalcFitness
### Title: Calculate the fitness of a population.
### Aliases: cmaCalcFitness

### ** Examples

cma <- cmaNew();
   cmaInit(cma,dimension=2,initialX=1.5);
   popR <- cmaSamplePopulation(cma);
   fitFunc <- function(x) {sum(x*x)};
   fitness <- cmaCalcFitness(cma,popR,fitFunc);
   cmaUpdateDistribution(cma,fitness);



