library(CoopGame)


### Name: gatelyValue
### Title: Compute Gately point
### Aliases: gatelyValue gatelyPoint

### ** Examples

library(CoopGame)
gatelyValue(c(0,0,0,1,1,1,3.5))

## No test: 
library(CoopGame)
v=c(0,0,0,4,0,3,6)
gatelyValue(v)

#Output (18/11,36/11,12/11):
#1.636364 3.272727 1.090909

#Example from original paper by Gately (1974)
library(CoopGame)
v=c(0,0,0,1170,770,210,1530)
gatelyValue(v)

#Output:
#827.7049 476.5574 225.7377 
## End(No test)




