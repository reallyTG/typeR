library(samon)


### Name: samonGenIM
### Title: Sensitivity Analysis for monotone missing data
### Aliases: samonGenIM

### ** Examples

data("VAS1")

# define the imputation models
NT                <- ncol(VAS1)
inmodel           <- matrix(1,NT,6)
inmodel[1,]       <- 0
inmodel[NT,]      <- 0
inmodel[NT-1,4:6] <- 0

Sample1 <- samonGenIM(
  mat           =    VAS1, # imput matrix
  Npart         =       5, # number of partitions
    
  InitialSigmaH =    27.9, # initial value
  HighSigmaH    =   100.0, # high value for H
    
  InitialSigmaF =     7.3, # initial value
  HighSigmaF    =   100.0, # high value for F
    
  NSamples      =      12, # number of samples
    
  seed0         =     441, # sample seed
  seed1         =     511, # impute seed 
  inmodel       = inmodel) # input model



