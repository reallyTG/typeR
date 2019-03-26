library(haplo.stats)


### Name: haplo.scan
### Title: Search for a trait-locus by sliding a fixed-width window over
###   each marker locus and scanning all possible haplotype lengths within
###   the window
### Aliases: haplo.scan haplo.scan.obs haplo.scan.sim

### ** Examples

  # create a random genotype matrix with 10 loci, 50 cases, 50 controls
  set.seed(1)
  tmp <- ifelse(runif(2000)>.3, 1, 2)
  geno <- matrix(tmp, ncol=20)
  y <- rep(c(0,1),c(50,50))

  # search 10-locus region, typically don't limit the number of
  # simulations, but run time can get long with many simulations

  scan.obj <- haplo.scan(y, geno, width=3,
                sim.control = score.sim.control(min.sim=10, max.sim=20))

  print(scan.obj)



