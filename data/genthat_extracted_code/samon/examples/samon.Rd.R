library(samon)


### Name: samon
### Title: Sensitivity Analysis for monotone missing data
### Aliases: samon

### ** Examples

data("samonPANSS1")

Results1 <- samon(
  mat            = samonPANSS1,
  Npart          =          10, # number of partitions
    
  InitialSigmaH  =        15.0, # initial value
  HighSigmaH     =        50.0, # high value for H
    
  InitialSigmaF  =         8.0, # initial value
  HighSigmaF     =        50.0, # high value for F
    
  lb             =          30, # parameters to
  ub             =         210, # cumulative 
  zeta1          =         4.0, # beta distribution
  zeta2          =         7.0,

  alphaList      =        -1:1 )



