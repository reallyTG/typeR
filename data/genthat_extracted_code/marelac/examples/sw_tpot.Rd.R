library(marelac)


### Name: sw_tpot
### Title: Potential Temperature of Seawater
### Aliases: sw_tpot
### Keywords: utilities

### ** Examples

sw_tpot(S = 40, t = 40:45, p = 1000)

## check values
sw_tpot(S = 25, t = 40, p = 0)      #40
sw_tpot(S = 25, t = 40, p = 100)    #36.6921
sw_tpot(S = 25, t = 10, p = 1000)   #8.4684
sw_tpot(S = 25, t = 0, p = 100)     #-0.0265

sw_tpot(S = 40, t = 40, p = 1000)  #36.89073



