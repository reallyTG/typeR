library(samon)


### Name: samonIM
### Title: samonIM: Sensitivity analysis for monotone missing and
###   intermittent missing data
### Aliases: samonIM

### ** Examples

data("VAS1")

# inputation model
NT            <- ncol(VAS1)
inmodel       <- matrix(1,NT,6)
inmodel[1,]   <- 0
inmodel[NT,]  <- 0
inmodel[,4:6] <- 0

Results <- samonIM(
  mat           =    VAS1, # imput matrix
  Npart         =       2, # number of partitions
    
  InitialSigmaH =    25.0, # initial value
  HighSigmaH    =   100.0, # high value for H
    
  InitialSigmaF =     8.0, # initial value
  HighSigmaF    =   100.0, # high value for F
    
  lb            =       0, # parameters for
  ub            =     102, # cumulative 
  zeta1         =     1.2, # beta distribution
  zeta2         =     1.6,

  NSamples      =       0, # no of bootstraps
  NIMimpute     =       2, # no of imputations 
    
  seed0         =     441, # seed for bootstraps
  seed1         =     511, # seed for imputations
  inmodel       = inmodel, # input model
    
  alphaList     =   -1:1 )



