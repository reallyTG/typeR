library(TKF)


### Name: TKF91
### Title: Evolutionary distance estimation with TKF91 model
### Aliases: TKF91 TKF91Pair
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
  TKF91(fasta, mu=5.920655e-04, 
        substModel=GONNET, substModelBF=GONNETBF)
  ## 2D estimation: joint estimation of distance and mu
  TKF91(fasta, substModel=GONNET, substModelBF=GONNETBF)
  ## only apply to a pair of sequences
  seq1 <- fasta[[1]]
  seq2 <- fasta[[2]]
  TKF91Pair(seq1, seq2, mu=5.920655e-04, 
            substModel=GONNET, substModelBF=GONNETBF)
  
## End(No test)



