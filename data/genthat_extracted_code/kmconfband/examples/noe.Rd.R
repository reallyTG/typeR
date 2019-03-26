library(kmconfband)


### Name: noe
### Title: Noe Recursions for the Exact Coverage Probability of a
###   Nonparametric Confidence Band for the Survivor Function
### Aliases: noe

### ** Examples

## A check of the Noe recursion calculations.  This result is cited in 
## Jager and Wellner's 2005 technical report, Table 1, p. 13.
## The correct value is 0.95

a<-c(0.001340,0.028958,0.114653,0.335379)
b<-c(0.664621,0.885347,0.971042,0.998660)
print(noe(4,a,b))



