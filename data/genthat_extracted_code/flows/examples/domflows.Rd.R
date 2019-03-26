library(flows)


### Name: domflows
### Title: Dominant Flows Selection
### Aliases: domflows

### ** Examples

# Import data
data(nav)
myflows <- prepflows(mat = nav, i = "i", j = "j", fij = "fij")

# Remove the matrix diagonal
diag(myflows) <- 0

# Select the dominant flows (incoming flows criterion)
flowSel <- domflows(mat = myflows, w = colSums(myflows), k = 1)
statmat(mat = myflows * flowSel, output = "none")



