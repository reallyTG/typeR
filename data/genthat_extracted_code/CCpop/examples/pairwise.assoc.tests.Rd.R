library(CCpop)


### Name: pairwise.assoc.test.unconstrained.chisq
### Title: Pairwise association tests
### Aliases: pairwise.assoc.tests pairwise.assoc.test.unconstrained.chisq
###   pairwise.assoc.test.unconstrained.gsq pairwise.assoc.test.case.only
###   pairwise.assoc.test.ind.3d pairwise.assoc.test.pure.unconstrained
###   pairwise.assoc.test.kpy pairwise.assoc.test.hwe.le.kpy
###   pairwise.assoc.test.kpx.kpy pairwise.assoc.test.pop.kpy
###   pairwise.assoc.test.pop.hwe.le.kpy pairwise.assoc.test.pure.pop.kpy
###   pairwise.assoc.test.pure.pop.hwe.le.kpy
###   conditional.assoc.test.pure.pop.hwe.le.kpy

### ** Examples

  ## An example marginal/pairwise association
  
  # Controls
  t0 = matrix(c(375,  240,   46,
                640,  405,   62,
                300,  169,   19), nrow = 3, byrow = TRUE)
                
  # Cases
  t1 = matrix(c(317,  162,   15,
                459,  209,   22,
                120,   76,   13), nrow = 3, byrow = TRUE)
  
  # Independent population sample, marginalized for SNP1 and SNP2
  tp1 = c(2410, 4253, 1945)
  tp2 = c(4972, 3140,  496)
  
  ## The prevalence of the studied disease in the population
  prevalence = 0.001

  marginal.assoc.test.pop.hwe.kpy(t0 = rowSums(t0), t1 = rowSums(t1), tp = tp1, prevalence)
  marginal.assoc.test.pop.hwe.kpy(t0 = colSums(t0), t1 = colSums(t1), tp = tp2, prevalence)
  pairwise.assoc.test.pop.hwe.le.kpy(t0, t1, tp1, tp2, prevalence)  
  conditional.assoc.test.pure.pop.hwe.le.kpy(t0, t1, tp1, tp2, prevalence)



