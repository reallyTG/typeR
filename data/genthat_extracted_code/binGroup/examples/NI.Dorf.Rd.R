library(binGroup)


### Name: NI.Dorf
### Title: Find the optimal testing configuration for non-informative
###   two-stage hierarchical testing
### Aliases: NI.Dorf

### ** Examples

# Find the OTC for non-informative two-stage 
#   hierarchical (Dorfman) testing over a range 
#   of group sizes.
# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
NI.Dorf(p=0.01, Se=0.95, Sp=0.95, group.sz=2:100, 
obj.fn=c("ET", "MAR"))

# Calculate the operating characteristics for a specified 
#   initial group size for non-informative two-stage 
#   hierarchical (Dorfman) testing.
# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
NI.Dorf(p=rep(0.025, 50), Se=0.90, Sp=0.90, group.sz=50,
obj.fn=c("ET", "MAR", "GR"), weights=matrix(data=c(1,1,10,10), 
nrow=2, ncol=2, byrow=TRUE))



