library(samon)


### Name: samonGen
### Title: Sensitivity Analysis for monotone missing data
### Aliases: samonGen

### ** Examples

data(samonPANSS1)

Sample1 <- samonGen(
  mat            = samonPANSS1,
  Npart          =           5, # number of partitions
    
  InitialSigmaH  =        15.6, # initial value
  HighSigmaH     =        25.0, # high value for H
    
  InitialSigmaF  =         8.6, # initial value
  HighSigmaF     =        15.0, # high value for F
    
  seed           =         211,
  NSamples       =          30 )



