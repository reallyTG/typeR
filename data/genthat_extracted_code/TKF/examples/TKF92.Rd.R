library(TKF)


### Name: TKF92
### Title: Evolutionary distance estimation with TKF92 model
### Aliases: TKF92 TKF92Pair
### Keywords: ~kwd1 ~kwd2

### ** Examples

  ## No test: 
    ## This example is not tested due to running time > 5s
  data(GONNET)
  data(GONNETBF)
  library(seqinr)
  fasta <- read.fasta(file.path(system.file("extdata", package="TKF"),
                      "pair1.fasta"),
                      seqtype="AA", set.attributes=FALSE)
  ## 1D estimation: only distance
  TKF92(fasta, mu=0.0006137344, r=0.7016089061,
        substModel=GONNET, substModelBF=GONNETBF)
  
  ## 2D estimation: joint estimation of distance, mu and r
  TKF92(fasta, substModel=GONNET, substModelBF=GONNETBF)
  
  ## only apply to a pair of sequences
  seq1 <- fasta[[1]]
  seq2 <- fasta[[2]]
  TKF92Pair(seq1, seq2, mu=0.0006137344, r=0.7016089061,
            substModel=GONNET, substModelBF=GONNETBF)
  
## End(No test)



