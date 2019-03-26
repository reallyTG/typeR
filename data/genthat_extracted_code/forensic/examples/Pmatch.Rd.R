library(forensic)


### Name: Pmatch
### Title: Match Probabilities of Genotype
### Aliases: Pmatch
### Keywords: misc

### ** Examples

## match probability of thirteen-locus genotype 
    ## (11 heterozygous and 2 homozygous loci)
    p<-c(0.057,0.160,0.024,0.122,0.078,0.055,0.035,0.150,
      0.195,0.027,0.084,0.061,0.122,0.083,0.164,0.065,0.143,
      0.151,0.167,0.180,0.099,0.182,0.120,0,0.182,0)
    ## suspect and offender are unrelated 
    Pmatch(p)
    ## suspect and offender are unrelated but members of the same 
    ## subpopulation with the coancestry coefficient theta 
    Pmatch(p, theta = 0.03)
    ## suspect and offender are close relatives (cousins) 
    Pmatch(p, k = c(3/4, 1/4, 0))
    ## suspect and offender are close relatives (cousins) and 
    ## members of the same subpopulation with the coancestry 
    ## coefficient theta 
    Pmatch(p, k = c(3/4, 1/4, 0), theta = 0.03)
    ##
    ## one locus
    Pmatch(p[1:2], theta = 0.03)
    Pmatch(p[25:26], theta = 0.03)
    ## compare
    Pevid.gen(alleles = c(1, 2), prob = p[1:2], V = "1/2", x = 1, 
      theta = 0.03)
    Pevid.gen(alleles = "a", prob = p[25], V = "a/a", x = 1, 
      theta = 0.03)





