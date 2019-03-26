library(flows)


### Name: compmat
### Title: Comparison of Two Matrices
### Aliases: compmat

### ** Examples

# Import data
data(nav)
myflows <- prepflows(mat = nav, i = "i", j = "j", fij = "fij")

# Remove the matrix diagonal
diag(myflows) <- 0

# Select the dominant flows (incoming flows criterion)
flowSel1 <- domflows(mat = myflows, w = colSums(myflows), k = 1)
# Select the first flows
flowSel2 <- firstflows(mat = myflows, method = "nfirst", ties.method = "first",
                       k = 1)
# Select flows greater than 2000
flowSel3 <- firstflows(mat = myflows, method = "xfirst", k = 2000)

# Combine selections
flowSel <- myflows * flowSel1 * flowSel2 * flowSel3

# Compare flow matrices
compmat(mat1 = myflows, mat2 = flowSel, digits = 1)



