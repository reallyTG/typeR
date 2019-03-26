library(endtoend)


### Name: ETE
### Title: Theoretical transmissions/receptions for a L-limited End to End
###   model
### Aliases: ETE
### Keywords: End to End transmissions receptions network

### ** Examples

#An N=5 End to End system with limited L=7 retransmission per hop
ETE(p1=0.65,p2=0.4,L=7,N=5)

#An unlimited N=5 End to End system
ETE(p1=0.65,p2=0.4,L=Inf,N=5)



