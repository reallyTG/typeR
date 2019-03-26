library(Frames2)


### Name: PiklB
### Title: Matrix of inclusion probabilities for units selected in sample
###   from frame B
### Aliases: PiklB
### Keywords: datasets

### ** Examples

data(PiklB)
#Let choose the submatrix of inclusion probabilities for the first 5 units in sB.
PiklB[1:5, 1:5]
#Now, let select the first order inclusion probabilities
diag(PiklB)




