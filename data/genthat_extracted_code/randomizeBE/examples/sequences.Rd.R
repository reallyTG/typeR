library(randomizeBE)


### Name: sequences
### Title: Obtain sequences for BE study designs
### Aliases: sequences

### ** Examples

# classical 2x2 crossover in TR notation (simple enough to remember
sequences("2x2", tmts=c("T","R"))
# 3-treatment-6-sequence-3-period Williams design in ABC notation
sequences("3x6x3")
# 3-treatment-3-sequence-3-period design with one Test and two References
sequences("3x3", tmts=c("T","R1","R2"))
# 4-treatment-4-period in TxRy notation, two Test and two Reference
sequences("4x4", tmts=c("T1","T2","R1","R2"))



