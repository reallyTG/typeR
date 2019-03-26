library(galgo)


### Name: evaluate.Niche
### Title: Evaluates the chromosome using a fitness function
### Aliases: evaluate.Niche Niche.evaluate evaluate.Niche
###   evaluate,Niche-method
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  cr
  ni <- Niche(chromosomes = newRandomCollection(cr, 10))
  ni
  fn <- function(chr, parent) { sd(as.double(chr))/mean(as.double(chr)) }
  evaluate(ni, fn, parent)
  getFitness(ni) ## see results
  summary(ni)



