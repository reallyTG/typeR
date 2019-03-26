library(galgo)


### Name: Niche
### Title: The representation of a set of chromosomes for genetic
###   algorithms
### Aliases: Niche
### Keywords: classes programming methods

### ** Examples

   cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
   ni <- Niche(chromosomes=newRandomCollection(cr, 10))
   ni

   ## in average, one of 10 genes can be mutated
   mf <- function(niche) niche$pMutations * length(niche) * length(niche$chromosomes[[1]])
   ni2 <- Niche(chromosomes=newRandomCollection(cr, 10),
          mutationsFunc=mf,
		   pMutations=1/10)
   ni2    # random initial niche
   mutate(ni2) # returns the chromosomes indexes that were mutated
   ni2    # mutated niche
 


