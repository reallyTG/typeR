library(TKF)


### Name: TKF92HG
### Title: Evolutionary distance estimation with TKF92 model considering
###   the regional heterogeneity of substitution rates
### Aliases: TKF92HG TKF92HGPair
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
  TKF92HG(fasta, mu=5.920655e-04, r=0.8, Ps=1, Kf=1.2,
          substModel=GONNET, substModelBF=GONNETBF)
  
  ## 2D estimation: joint estimation of distance, mu and r
  TKF92HG(fasta, substModel=GONNET, substModelBF=GONNETBF)
  
  ## only apply to a pair of sequences
  seq1 <- fasta[[1]]
  seq2 <- fasta[[2]]
  TKF92HGPair(seq1, seq2, mu=5.920655e-04, r=0.8, Ps=1, Kf=1.2,
            substModel=GONNET, substModelBF=GONNETBF)
  
## End(No test)



