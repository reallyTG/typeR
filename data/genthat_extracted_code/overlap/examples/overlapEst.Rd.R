library(overlap)


### Name: overlapEst
### Title: Estimates of coefficient of overlapping
### Aliases: overlapEst

### ** Examples

# Get example data:
data(simulatedData)

# Use defaults:
overlapEst(tigerObs, pigObs)
#     Dhat1     Dhat4     Dhat5 
# 0.2908618 0.2692011 0.2275000 

overlapEst(tigerObs, pigObs, type="Dhat4")
#    Dhat4
#    0.2692011



