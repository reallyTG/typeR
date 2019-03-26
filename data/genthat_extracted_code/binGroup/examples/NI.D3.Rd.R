library(binGroup)


### Name: NI.D3
### Title: Find the optimal testing configuration for non-informative
###   three-stage hierarchical testing
### Aliases: NI.D3

### ** Examples

# Find the OTC for non-informative three-stage 
#   hierarchical testing over a range of group sizes.
# This example takes approximately 20 seconds to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
## Not run: 
##D NI.D3(p=0.02, Se=0.90, Sp=0.90, group.sz=3:30, 
##D obj.fn=c("ET", "MAR"))
## End(Not run)

# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
NI.D3(p=0.02, Se=0.90, Sp=0.90, group.sz=3:12, 
obj.fn=c("ET", "MAR"))

# Find the OTC out of all possible configurations for 
#   a specified group size for non-informative
#   three-stage hierarchical testing.
# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
NI.D3(p=rep(0.005, 15), Se=0.99, Sp=0.99, group.sz=15,
obj.fn=c("ET", "MAR", "GR"), weights=matrix(data=c(1,1,10,10), 
nrow=2, ncol=2, byrow=TRUE))



