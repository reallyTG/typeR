library(Frames2)


### Name: PiklA
### Title: Matrix of inclusion probabilities for units selected in sample
###   from frame A
### Aliases: PiklA
### Keywords: datasets

### ** Examples

data(PiklA)
#Let choose the submatrix of inclusion probabilities for the first 5 units sA.
PiklA[1:5, 1:5]
#Now, let select only the first order inclusion probabilities
diag(PiklA)




