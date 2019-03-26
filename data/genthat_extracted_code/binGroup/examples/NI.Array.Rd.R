library(binGroup)


### Name: NI.Array
### Title: Find the optimal testing configuration for non-informative array
###   testing without master pooling
### Aliases: NI.Array

### ** Examples

# Find the OTC for non-informative array testing 
#   without master pooling over a range of group
#   (row/column) sizes.
# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
NI.Array(p=0.04, Se=0.95, Sp=0.95, group.sz=3:10,
obj.fn=c("ET", "MAR"))

# Calculate the operating characteristics for a specified 
#   group (row/column) size for non-informative array 
#   testing without master pooling.
# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
NI.Array(p=rep(0.01, 64), Se=0.90, Sp=0.90, group.sz=8,
obj.fn=c("ET", "MAR", "GR"), 
weights=matrix(data=c(1,1,10,10,100,100), 
nrow=3, ncol=2, byrow=TRUE))



