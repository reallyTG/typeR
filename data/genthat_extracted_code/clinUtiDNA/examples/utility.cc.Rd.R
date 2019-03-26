library(clinUtiDNA)


### Name: utility.cc
### Title: Calculation of the utility index for case-control data
### Aliases: utility.cc

### ** Examples

## Parameter initialisation
cases <- c(36,10,84,25)
contr <- c(100,4,63,2)
pD <- c(22,9420)
pG <- c(52,618) 
## Calculation of the utility index
utility.cc(cases,contr,pD,pG)  # with pD and pG estimated from external data
utility.cc(cases,contr,pD,pG=0.078) # with known pG
utility.cc(cases,contr,pD=0.002,pG) #  with known pD
utility.cc(cases,contr,pD=0.002,pG=0.078) # with known pD and pG



