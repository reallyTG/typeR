library(metRology)


### Name: GUM
### Title: Propagation of Measurement Uncertainty for Typical Metrology
###   Applications Using the Methods Outlined in the GUM
### Aliases: GUM
### Keywords: univar htest

### ** Examples

## a simple uncertainty analysis for the product of two quantities
GUM(c("x1","x2"),c(2.3,1.1),c(0.030,0.015),c(5,9999),"x1*x2")

## example of the difference in the measurements of two standards, each 
## with a standard uncertainty based on a common value drawn from a control chart
## representative of the measurement process made using a check standard that 
## is comparable to the two individual standards under study
GUM(c("s1","s2"),c(45.3,46.0),c(0.26,0.26),c(134,134),"s1-s2",shared.u.i=c("s1","s1"))

## compare with results for equivalent, alternative specification of shared.u.i
GUM(c("s1","s2"),c(45.3,46.0),c(0.26,0.26),c(134,134),"s1-s2",shared.u.i=c("s2","s2"))



