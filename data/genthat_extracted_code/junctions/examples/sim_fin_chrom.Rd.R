library(junctions)


### Name: sim_fin_chrom
### Title: Individual Based Simulation of the accumulation of junctions
### Aliases: sim_fin_chrom
### Keywords: finite chromosome simulation

### ** Examples

  N = 100 #population size
  R = 100
  H_0 = 0.5 #initial heterozygosity
  maxT = 1000 #run time
  C = 1 #number of recombinations per meiosis
  seed = 42

  v <- sim_fin_chrom(N, H_0, maxT, C, seed, R)



