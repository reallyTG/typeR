library(HDclust)


### Name: vb
### Title: Make an instance of class "VB"
### Aliases: vb

### ** Examples

# variable block structure for GMM with 3 dimensions and 2 mixture states
Vb <- vb(1, dim=3, numst=2)

# variable block structure with 2 variable blocks
Vb <- vb(2, dim=10, bdim=c(4,6), numst=c(3,11), varorder=list(c(1:4),c(5:10)))



