library(GPoM)


### Name: autoGPoMoSearch
### Title: Automatic search of polynomial Equations
### Aliases: autoGPoMoSearch

### ** Examples

# Load data
data('RosYco')
# Search for potential models
filt = autoGPoMoSearch(RosYco[,2], nVar = 3, dMax = 2,
                       dt = 1/125, show = 1)
# As an example, the equations of the fourth line has the following terms:
poLabs(nVar = 3, dMax = 2)[filt$filtMemo[5,] != 0]
# which coefficients correspond to
cbind(filt$KMemo[5,], poLabs(nVar = 3, dMax = 2))[filt$filtMemo[5,] != 0,]




