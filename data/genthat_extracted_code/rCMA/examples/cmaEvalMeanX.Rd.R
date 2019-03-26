library(rCMA)


### Name: cmaEvalMeanX
### Title: Evaluate the meanX of the current population.
### Aliases: cmaEvalMeanX

### ** Examples

## Not run: 
##D    ## just to show the syntax, without calling cmaOptimDP
##D    fitFunc <- function(x) {  sum(x*x); }
##D    isFeasible <- function(x) {  TRUE;  }
##D    cma <- cmaNew(propFile="CMAEvolutionStrategy.properties");
##D    cmaInit(cma,dimension=2,initialX=1.5);
##D    bestSolution=cmaEvalMeanX(cma,fitFunc,isFeasible);
##D    str(bestSolution);
##D    
## End(Not run)



