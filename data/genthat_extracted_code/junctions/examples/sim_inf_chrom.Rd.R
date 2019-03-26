library(junctions)


### Name: sim_inf_chrom
### Title: Individual Based Simulation of the accumulation of junctions
### Aliases: sim_inf_chrom
### Keywords: infinite chromosome simulation

### ** Examples

  N = 100 #population size
  H_0 = 0.5 #initial heterozygosity
  maxT = 1000 #run time
  C = 1 #number of recombinations per meiosis
  numMarkers = 100
  seed = 42

  v <- sim_inf_chrom(N, H_0, maxT, C, numMarkers, seed)

  plot(v$avgJunctions, type = "l", xlab = "Generations",
        ylab = "Number of Junctions", main = "Example Infinite Chromosome")
  lines(v$detectedJunctions, col = "blue")
  legend("bottomright", c("Real number","Number detected"),
       lty = 1, col = c("black", "blue"))



