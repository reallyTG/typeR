library(OmicKriging)


### Name: write_GRMBin
### Title: Write GRM binary files.
### Aliases: write_GRMBin

### ** Examples

  
  ## create a random genotype matrix
  nSamples <- 10
  mMarkers <- 100
  X <- matrix(rbinom(n=100, size=2, prob=0.5), nrow=nSamples)
  ## compute the Genetric Relatedness Matrix
  grm <- cor(X)
  ## write a Genetic Relatedness Matrix (GRM)
  ## NOTE: to following is not run here -- not writing any files in examples
  #write_GRMBin(grm, n.snps=mMarkers, prefix="grm.out")



